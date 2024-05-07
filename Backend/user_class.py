from flask_sqlalchemy import SQLAlchemy
from .base import db


class User(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    username = db.Column(db.String(255), nullable=False, default=None)
    password = db.Column(db.String(128), nullable=False, default=None)

    age = db.Column(db.Integer, nullable=True, default=None)
    email = db.Column(db.String(255), nullable=True, default=None, unique=True)

    gender = db.Column(db.String(1), nullable=False, default=None)

