from flask import Blueprint, request, jsonify
from database import mysql  # Import MySQL from database.py

project_bp = Blueprint('project', __name__)

@project_bp.route('/projects', methods=['GET'])
def get_projects():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM projects")
    projects = cur.fetchall()
    cur.close()
    return jsonify(projects)
