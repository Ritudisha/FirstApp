from flask import Flask,render_template, request, url_for,jsonify,json
#from flaskext.mysql import MySQL
from flask_mysqldb import MySQL
import hashlib


app = Flask(__name__)
mysql = MySQL()

##app.config['MySQL_DATABASE_PASSWORD'] = '123456'
#app.config['MySQL_DATABASE_DB'] = 'UserData'
#app.config['MySQL_DATABASE_HOST'] = 'localhost'

app.config['MYSQL_USER'] = 'ritudisha'
app.config['MYSQL_PASSWORD'] = '123456'
app.config['MYSQL_DB'] = 'Administration'
app.config['MYSQL_HOST'] = 'localhost'

mysql.init_app(app)

@app.route('/', methods = ['GET','POST'])
def Login():
  return render_template('index.html')

@app.route('/LoginCheck',methods = ['GET','POST'])
def LoginCheck():
    data = request.get_json() or request.values
    print data
    userName = data['userName']
    password = data['password']
    print userName
    h = hashlib.md5(password.encode())
    cur = mysql.connection.cursor()
    encodedPassword = h.hexdigest()
    cur.execute("SELECT UserId, UserName FROM UserDetails WHERE Email='" + userName + "' and Password='" + encodedPassword + "'")

    retData = cur.fetchone()
    #print retData[0]
    if retData is None:
        return "Failed"
    else:
        ip = request.remote_addr
        print ip
        cur.execute("INSERT INTO UserAccountAccessLog(UserId, LoginDateTime, IPAddress) VALUES('"+str(retData[0])+"', CURRENT_TIMESTAMP, '"+str(ip)+"')")
        mysql.connection.commit()
        affectedRows = cur.rowcount
        if(affectedRows > 0):
            return str(retData[0]) + "," + str(retData[1])

    return data

@app.route('/SignUp',methods = ['GET','POST'])
def SignUp():
     if request.method == 'POST':
         return render_template('SignUp.html')
     return render_template('SignUp.html')


@app.route('/SaveSignUp',methods = ['GET','POST'])
def SaveSignUp():
    data = request.get_json() or request.values
    print data
    email = data['email']
    name = data['name']
    contact = data['contact']
    password = data['password']


    h = hashlib.md5(password.encode())
    encodedPassword = h.hexdigest()
    print(h.hexdigest())
    data['password'] = encodedPassword

    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM UserDetails WHERE Email='" + email + "'")
    retdata = cur.fetchone()

    print retdata
    if retdata is None:

        query = "INSERT INTO UserDetails(UserName, Email, Contact, Password) VALUES('" + name + "', '"+email+"', '"+contact+"', '"+encodedPassword+"')"
        #print query
        cur.execute(query)
        mysql.connection.commit()
        affectedRows = cur.rowcount
        print affectedRows
        if(affectedRows > 0):
            query = "INSERT INTO UAccountEditsLog(UserId, EditDateTime, EditString, EditType, IPAddress) VALUES('" + email + "', CURRENT_TIMESTAMP, '"+str(data).replace("u'","").replace("'","")+"','New Account', '"+request.remote_addr+"')"
            print query
            cur.execute(query)
            mysql.connection.commit()
            affectedRows = cur.rowcount

            if(affectedRows > 0):
                return 'Successfully Inserted'
            else:
                return 'Error'
        else:
            return 'Error'
    else:
        return 'User name already in use'

    cur.close()

@app.route('/EditProfile',methods = ['GET','POST'])
def EditProfile():
    data = request.get_json() or request.values
    print data
    email = data['email']
    name = data['name']
    contact = data['contact']
    password = data['password']
    h = hashlib.md5(password.encode())
    if(password != ""):
        encodedPassword = h.hexdigest()
    else:
        encodedPassword = ""
    print(h.hexdigest())
    data['password'] = encodedPassword

    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM UserDetails WHERE Email='" + email + "'")
    retdata = cur.fetchone()
    if retdata is not None:
        query = "UPDATE UserDetails SET UserName = CASE WHEN '" + name + "'= ''THEN UserName ELSE '" + name + "' END, Email = '"+email+"', Contact = CASE WHEN '"+contact+"' = '' THEN Contact ELSE '"+contact+"'END , Password = CASE WHEN '"+encodedPassword+"'='' THEN Password ELSE '"+encodedPassword+"' END WHERE Email = '"+email+"'"
        #print query
        cur.execute(query)
        mysql.connection.commit()
        affectedRows = cur.rowcount
        print affectedRows
        if(affectedRows > 0):
            query = "INSERT INTO UAccountEditsLog(UserId, EditDateTime, EditString, EditType, IPAddress) VALUES('" + email + "', CURRENT_TIMESTAMP, '"+str(data).replace("u'","").replace("'","")+"','Updated', '"+request.remote_addr+"')"
            print query
            cur.execute(query)
            mysql.connection.commit()
            affectedRows = cur.rowcount

            if(affectedRows > 0):
                return 'Successfully Updated'
            else:
                return 'Error'
        else:
            return 'No Data to Update'
    else:
        return 'Invalid UserName'
    cur.close()

@app.route('/logOut',methods = ['GET','POST'])
def logOut():
    data = request.get_json() or request.values
    print data
    userId = data['userId']
    cur = mysql.connection.cursor()

    cur.execute("UPDATE UserAccountAccessLog SET LogoutDateTime = CURRENT_TIMESTAMP WHERE UserId = '"+str(userId)+"' AND IPAddress = '"+str(request.remote_addr)+"'")
    mysql.connection.commit()
    affectedRows = cur.rowcount
    if(affectedRows > 0):
        return 'Successfully Logged Out'

    return 'Error while logging out'

@app.route('/GetUserProfile',methods = ['GET','POST'])
def GetUserProfile():
    data = request.get_json() or request.values
    print data
    userId = data['userId']
    cur = mysql.connection.cursor()
    cur.execute("SELECT UserName, Email, Contact FROM UserDetails WHERE UserId='" + userId + "'")

    retData = cur.fetchone()
    print retData

    return json.dumps(retData)


if __name__ == '__main__':
  app.run(debug= True)


# disconnect from server
#db.close()
