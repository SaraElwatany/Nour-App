from flask_sqlalchemy import SQLAlchemy
from .base import db


class Assessment(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    fk_user_id = db.Column(db.Integer(), db.ForeignKey('user.id'), nullable=False)
    username = db.Column(db.String(255), nullable=True, default=None)
    email = db.Column(db.String(255), nullable=True, default=None)

    score = db.Column(db.Integer, nullable=True, default=None)