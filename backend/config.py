import os

class Config:
    MYSQL_HOST = "localhost"
    MYSQL_USER = "root"
    MYSQL_PASSWORD = "0000"
    MYSQL_DB = "project_management"
    SECRET_KEY = os.urandom(24)
