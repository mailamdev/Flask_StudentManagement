from flask import render_template, redirect, request, session, flash, url_for
from flask_login import login_user
from app import app, login, utils
from app.models import *
import hashlib

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/home")
def home():
    return render_template("dashboard/index.html")

@app.route("/login", methods=["GET", "POST"])
def login_usr():
    err_msg = ""
    if request.method == "POST":
        chucvu = request.form.get("chucvu")
        username = request.form.get("username")
        password = request.form.get("password", "")
        password = str(hashlib.md5(password.strip().encode("utf-8")).hexdigest())
        user = User.query.filter(User.username == username.strip(),
                                 User.password == password, User.chucvu == chucvu).first()
        if user:
            # session["user"] = user
            login_user(user=user)
            if user.chucvu == "admin":
                return redirect(url_for("admin.index"))
            else:
                return render_template("dashboard/index.html")
        else:
            err_msg = "Tên đăng nhập/ mật khẩu không chính xác"

    return render_template("login.html", err_msg=err_msg)



@app.route('/logout')
def logout():
    session.pop('username', None)
    return redirect(url_for('index'))

@login.user_loader
def user_load(user_id):
    return User.query.get(user_id)

@app.route("/add-student", methods=["get", "post"])
def add_student():
    noti = ""
    if request.method.lower() == "post":
        hoten = request.form.get("hoten")
        gioitinh = request.form.get("gioitinh")
        ngaysinh = request.form.get("ngaysinh")
        diachi = request.form.get("diachi")
        email = request.form.get("email")
        lop = request.form.get("lop")
        hs = HocSinh(tenHS=hoten, gioiTinh=gioitinh, ngaySinh=ngaysinh, diaChi=diachi, email=email, maLop=lop)
        db.session.add(hs)
        db.session.commit()
        noti = "Thêm học sinh mới thành công"
    return render_template("dashboard/add-student.html", dsLop=Lop.query.order_by(Lop.maLop).all(),
                           dsHS=HocSinh.query.order_by(HocSinh.maHS).all(), noti=noti)


@app.route("/search", methods=["get", "post"])
def search():
    maHS = request.args.get("maHS")
    keyword = request.args.get("keyword")
    kwLop = request.args.get("kwLop")
    return render_template("dashboard/search.html", students=utils.read_students(maHS=maHS, keyword=keyword, kwLop=kwLop))


@app.route("/points", methods=["get", "post"])
def inputpoints():
    # tenlop = request.args.get("lop")
    # malop = Lop.query.filter(Lop.tenLop == tenlop)
    # students = HocSinh.query.filter(HocSinh.maLop == malop)

    dsLop = Lop.query.order_by(Lop.maLop).all()
    dsMH = MonHoc.query.order_by(MonHoc.maMH).all()
    dsHK = HocKy.query.order_by(HocKy.maHK).all()
    # students =
    return render_template("dashboard/input-points.html", dsMH=dsMH, dsLop=dsLop, dsHK=dsHK)

@app.route("/lapDsLop", methods=["get", "post"])
def lapDsLop():
    dsLop = Lop.query.order_by(Lop.maLop).all()
    students = HocSinh.query.order_by(HocSinh.maHS).all()
    return render_template("dashboard/lapDsLop.html", dsLop=dsLop, students=students)

@app.route("/baocaoMH", methods=["get", "post"])
def baocaoMH():
    dsLop = Lop.query.order_by(Lop.maLop).all()
    dsMH = MonHoc.query.order_by(MonHoc.maMH).all()
    dsHK = HocKy.query.order_by(HocKy.maHK).all()
    return render_template("dashboard/baocaoMonHoc.html", dsHK=dsHK, dsMH=dsMH)

@app.route("/baocaoHK", methods=["get", "post"])
def baocaoHK():
    dsHK = HocKy.query.order_by(HocKy.maHK).all()
    return render_template("dashboard/baocaoHocKy.html", dsHK=dsHK)

@app.route("/roles")
def list_roles():
    roles = QuyDinh.query.all()
    return render_template('admin/roles.html', roles=roles)

@app.route("/delele_role")
def delele_role(maQD):
    role = QuyDinh.query.all(maQD)
    db.session.delete(role)
    db.session.commit()
    return render_template('admin/roles.html')

if __name__ == "__main__":
    app.run(debug=True)
