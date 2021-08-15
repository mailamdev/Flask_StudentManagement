from app import db
from .models import HocSinh, Lop

def read_students(maHS=None, keyword=None, kwLop=None):
    students = HocSinh.query
    if maHS:
        students = students.filter(HocSinh.maHS == maHS)
    if keyword:
        students = students.filter(HocSinh.tenHS.contains(keyword))
    if kwLop:
        students = students.filter(HocSinh.maLop.contains(kwLop))
    return students.all()

def read_students_class(tenlop=None):
    students = HocSinh.query
    if tenlop:
        malop = Lop.query.filter(Lop.tenLop == tenlop)
        students = students.filter(HocSinh.maLop == malop)
    return students.all()