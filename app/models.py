from sqlalchemy import Column, String, Float, Integer, Boolean, ForeignKey, Date
from sqlalchemy.orm import relationship
from flask_admin.contrib.sqla import ModelView
from flask_admin import BaseView, expose
from flask import render_template
from flask_login import UserMixin, current_user, logout_user
from flask import redirect, abort
from app import db, admin

### DATABASE ###

class User(db.Model, UserMixin):
    __tablename__ = "User"
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(50), nullable=False)
    username = Column(String(50), nullable=False)
    password = Column(String(50), nullable=False)
    email = Column(String(50), nullable=True)
    chucvu = Column(String(60), nullable=False)
    active = Column(Boolean, default=True)

    def __str__(self):
        return self.name

class Admin(db.Model):
    __tablename__ = "Admin"
    id_admin = Column(Integer, primary_key=True, autoincrement=True)
    user_id = Column(Integer, ForeignKey(User.id), nullable=False)

class Khoi(db.Model):
    __tablename__ = "Khoi"
    maKhoi = Column(Integer, primary_key=True)
    tenKhoi = Column(String(20), nullable=False)
    soLop = Column(Integer, nullable=False)

class Lop(db.Model):
    __tablename__ = "Lop"
    maLop = Column(Integer, primary_key=True, autoincrement=True)
    tenLop = Column(String(20), nullable=False)
    siSo = Column(Integer, nullable=False)
    maKhoi = Column(Integer, ForeignKey(Khoi.maKhoi), nullable=False)

class HocSinh(db.Model):
    __tablename__ = "HocSinh"
    maHS = Column(Integer, primary_key=True, autoincrement=True)
    tenHS = Column(String(100), nullable=False)
    gioiTinh = Column(String(10), nullable=False)
    ngaySinh = Column(Date, nullable=False)
    diaChi = Column(String(200), nullable=False)
    email = Column(String(50), nullable=True)
    maLop = Column(Integer, ForeignKey(Lop.maLop), nullable=True)
    db.session.commit()

class HocKy(db.Model):
    __tablename__ = "HocKy"
    maHK = Column(Integer, primary_key=True, autoincrement=True)
    tenHK = Column(String(20), nullable=False)

class MonHoc(db.Model):
    __tablename__ = "MonHoc"
    maMH = Column(Integer, primary_key=True, autoincrement=True)
    tenMH = Column(String(20), nullable=False)

class Diem(db.Model):
    __tablename__ = "Diem"
    maDiem = Column(Integer, primary_key=True, autoincrement=True)
    maHK = Column(Integer, ForeignKey(HocKy.maHK), nullable=False)
    maMH = Column(Integer, ForeignKey(MonHoc.maMH), nullable=False)
    maHS = Column(Integer, ForeignKey(HocSinh.maHS), nullable=False)
    diemTB = Column(Float, nullable=True)

class LoaiDiem(db.Model):
    __tablename__ = "LoaiDiem"
    maLD = Column(Integer, primary_key=True, autoincrement=True)
    tenLD = Column(String(20), nullable=False)

class ChiTietDiem(db.Model):
    __tablename__ = "ChiTietDiem"
    maCTD = Column(Integer, primary_key=True, autoincrement=True)
    maLD = Column(Integer, ForeignKey(LoaiDiem.maLD), nullable=False)
    maDiem = Column(Integer, ForeignKey(Diem.maDiem), nullable=False)
    diemSo = Column(Float, nullable=False)

class QuyDinh(db.Model):
    __tablename__ = "QuyDinh"
    maQD = Column(Integer, primary_key=True, autoincrement=True)
    tenQD = Column(String(50), nullable=False)
    noiDung = Column(String(200), nullable=False)

class ThayDoiQD(db.Model):
    __tablename__ = "ThayDoiQD"
    id = Column(Integer, primary_key=True, autoincrement=True)
    maQD = Column(Integer, ForeignKey(QuyDinh.maQD), nullable=False)
    maAdmin = Column(Integer, ForeignKey(Admin.id_admin), nullable=False)
#######


class Controller(ModelView):
    def is_accessible(self):
        if current_user.chucvu == 'admin':
            return current_user.is_authenticated
        else:
            return abort(404)
    def not_auth(self):
        return "Bạn không có quyền truy cập"

class AboutUsView(BaseView):
    @expose("/")
    def __index__(self):
        return self.render("admin/about-us.html")

    def is_accessible(self):
        return current_user.is_authenticated


admin.add_view(AboutUsView(name="Giới Thiệu"))
admin.add_view(ModelView(User, db.session, name="Quản Lý Người dùng"))
admin.add_view(ModelView(QuyDinh, db.session, name="Thay Đổi Quy Định"))

if __name__ == "__main__":
    db.create_all()