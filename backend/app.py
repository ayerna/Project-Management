from flask import Flask
from flask_cors import CORS
from flask_mysqldb import MySQL

app = Flask(__name__)
CORS(app)

# MySQL Configuration
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = '0000'
app.config['MYSQL_DB'] = 'project_management'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'

# Import MySQL from database.py
from database import mysql  
mysql.init_app(app)  # Initialize MySQL with Flask app

# Import routes after initializing MySQL
from routes import project_routes
app.register_blueprint(project_routes.project_bp)

if __name__ == "__main__":
    app.run(debug=True)
