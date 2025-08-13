CREATE DATABASE project_management_system;
USE project_management_system;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    role ENUM('Developer','Tester','Manager') NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);
ALTER TABLE users
ADD COLUMN password_hash TEXT;
CREATE TABLE Project (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    start_date DATE,
    end_date DATE
);

CREATE TABLE tasks (
    task_id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    assigned_to INT,  -- FK to users.user_id
    status ENUM('Pending','In Progress','Completed') NOT NULL DEFAULT 'Pending',
    deadline DATE,
    FOREIGN KEY (project_id) REFERENCES projects(project_id) ON DELETE CASCADE,
    FOREIGN KEY (assigned_to) REFERENCES users(user_id) ON DELETE SET NULL
);

CREATE TABLE bugs (
    bug_id INT AUTO_INCREMENT PRIMARY KEY,
    task_id INT NOT NULL,
    description TEXT NOT NULL,
    severity ENUM('Low','Medium','High','Critical') NOT NULL,
    status ENUM('Open','In Progress','Resolved','Closed') NOT NULL DEFAULT 'Open',
    reported_date DATE,
    resolved_date DATE,
    FOREIGN KEY (task_id) REFERENCES tasks(task_id) ON DELETE CASCADE
);
CREATE TABLE builds (
    build_id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT NOT NULL,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    duration INT,  -- Duration in seconds
    outcome ENUM('Success','Failure') NOT NULL,
    FOREIGN KEY (project_id) REFERENCES projects(project_id) ON DELETE CASCADE
);

INSERT INTO users (name, role, email) VALUES 
('Gladwin', 'Developer', 'gb@srmist.com'),
('Anirudh', 'Tester', 'an@srmist.com');

INSERT INTO projects (name, description, start_date, end_date) VALUES
('Project A', 'Description for Project A', '2025-01-01', '2025-06-01'),
('Project B', 'Description for Project B', '2025-02-01', '2025-07-01'),
('Project G', 'Description for Project G', '2025-03-01', '2025-08-01'),
('Project X', 'Description for Project X', '2025-04-01', '2025-09-01'),
('Project Y', 'Description for Project Y', '2025-05-01', '2025-10-01');

INSERT INTO tasks (project_id, title, description, assigned_to, status, deadline) VALUES
(1, 'Design Database Schema', 'Design the ER diagram and schema for Project A.', 1, 'Completed', '2025-01-10'),
(1, 'Develop Backend API', 'Implement the backend using Flask.', 1, 'In Progress', '2025-01-20'),
(2, 'Setup CI/CD Pipeline', 'Configure continuous integration for Project Beta.', 2, 'Pending', '2025-02-15'),
(3, 'UI/UX Design', 'Create wireframes for Project G UI.', 3, 'In Progress', '2025-03-10'),
(4, 'Write Documentation', 'Document the project requirements and design.', 4, 'Pending', '2025-04-20'),
(5, 'Conduct Testing', 'Perform unit and integration testing for Project Y.', 5, 'Pending', '2025-05-15');

INSERT INTO bugs (task_id, description, severity, status, reported_date, resolved_date) VALUES
(2, 'API returns error on invalid input', 'High', 'Open', '2025-01-22', NULL),
(3, 'CI/CD pipeline failure on merge', 'Critical', 'Open', '2025-02-16', NULL),
(4, 'UI not responsive on mobile devices', 'Medium', 'In Progress', '2025-03-12', NULL),
(5, 'Documentation missing key module details', 'Low', 'Resolved', '2025-04-22', '2025-04-25'),
(6, 'Test cases not covering edge scenarios', 'Medium', 'Open', '2025-05-16', NULL);

INSERT INTO builds (project_id, duration, outcome) VALUES
(1, 120, 'Success'),
(2, 150, 'Failure'),
(3, 100, 'Success'),
(4, 200, 'Failure'),
(5, 130, 'Success');

SELECT * FROM users;
SELECT * FROM projects;
SELECT * FROM tasks;
SELECT * FROM bugs;
SELECT * FROM builds;

SELECT * FROM tasks WHERE project_id = 1;

SELECT * FROM bugs WHERE severity = 'High';

SELECT * FROM bugs WHERE status = 'Open';
