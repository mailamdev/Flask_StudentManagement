from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_admin import Admin
from flask_login import LoginManager

app = Flask(__name__)
app.secret_key = "b_5#y2Ldw3t4ft43hb__w#"
app.config["SQLALCHEMY_DATABASE_URI"] = "mysql+pymysql://root:123456@localhost/database?charset=utf8mb4"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = True
app.secret_key = "b_5#y2Lsa1!F4Q8zn@xec]/"
db = SQLAlchemy(app)

admin = Admin(app=app, name="QUẢN LÝ HỌC SINH", template_mode="bootstrap4")

login = LoginManager(app=app)