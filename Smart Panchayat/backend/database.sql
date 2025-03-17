```sql
CREATE DATABASE SmartPanchayat;

USE SmartPanchayat;

CREATE TABLE Users ( 
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    role ENUM('Citizen', 'Official', 'Admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Grievances (
    grievance_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    category ENUM('Road', 'Water', 'Electricity', 'Health', 'Education', 'Other') NOT NULL,
    description TEXT NOT NULL,
    status ENUM('Pending', 'In Progress', 'Resolved') DEFAULT 'Pending',
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    resolved_at TIMESTAMP NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

CREATE TABLE Agriculture (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    region VARCHAR(255) NOT NULL,
    crop_type VARCHAR(100) NOT NULL,
    season ENUM('Kharif', 'Rabi', 'Zaid') NOT NULL,
    yield_estimate DECIMAL(10,2) NOT NULL,
    weather_impact ENUM('Low', 'Medium', 'High') NOT NULL,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Education_Healthcare (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    type ENUM('School', 'Health Center') NOT NULL,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    staff_count INT NOT NULL,
    student_or_patient_count INT NOT NULL,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Budget (
    budget_id INT AUTO_INCREMENT PRIMARY KEY,
    department ENUM('Agriculture', 'Healthcare', 'Education', 'Infrastructure', 'Other') NOT NULL,
    allocated_amount DECIMAL(15,2) NOT NULL,
    spent_amount DECIMAL(15,2) DEFAULT 0.00,
    status ENUM('Allocated', 'Partially Used', 'Used') DEFAULT 'Allocated',
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    budget_id INT NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    purpose TEXT NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (budget_id) REFERENCES Budget(budget_id) ON DELETE CASCADE
);

CREATE TABLE AI_Insights (
    insight_id INT AUTO_INCREMENT PRIMARY KEY,
    type ENUM('Grievance Analysis', 'Resource Allocation', 'Agriculture Forecast', 'Health Monitoring') NOT NULL,
    data TEXT NOT NULL,
    generated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Projects (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    department ENUM('Infrastructure', 'Education', 'Health', 'Agriculture', 'Other') NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NULL,
    status ENUM('Planned', 'Ongoing', 'Completed') DEFAULT 'Planned',
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);INSERT INTO Users (name, email, password_hash, phone, role) VALUES 
('Amit Sharma', 'amit.sharma@example.com', 'hashed_password_1', '9876543210', 'Citizen'),
('Rajesh Kumar', 'rajesh.kumar@example.com', 'hashed_password_2', '9876543211', 'Official'),
('Priya Singh', 'priya.singh@example.com', 'hashed_password_3', '9876543212', 'Admin');

INSERT INTO Grievances (user_id, category, description, status) VALUES 
(1, 'Road', 'Potholes in the main street need repair.', 'Pending'),
(2, 'Water', 'Water supply is irregular in our area.', 'In Progress'),
(1, 'Electricity', 'Frequent power cuts in the village.', 'Resolved');

INSERT INTO Agriculture (region, crop_type, season, yield_estimate, weather_impact) VALUES 
('Punjab', 'Wheat', 'Rabi', 5000.50, 'Low'),
('Maharashtra', 'Sugarcane', 'Kharif', 7500.75, 'Medium'),
('Bihar', 'Rice', 'Zaid', 6000.25, 'High');

INSERT INTO Education_Healthcare (type, name, location, staff_count, student_or_patient_count) VALUES 
('School', 'Govt High School', 'Delhi', 25, 500),
('Health Center', 'Primary Health Center', 'Mumbai', 15, 300),
('School', 'Zilla Parishad School', 'Pune', 18, 400);

INSERT INTO Budget (department, allocated_amount, spent_amount, status) VALUES 
('Agriculture', 1000000.00, 500000.00, 'Partially Used'),
('Healthcare', 1500000.00, 1000000.00, 'Partially Used'),
('Education', 2000000.00, 500000.00, 'Allocated');

INSERT INTO Transactions (budget_id, amount, purpose) VALUES 
(1, 250000.00, 'Fertilizer subsidies for farmers'),
(2, 500000.00, 'Construction of new health center'),
(3, 200000.00, 'Purchase of books and school supplies');

INSERT INTO AI_Insights (type, data) VALUES 
('Grievance Analysis', 'High complaints about road conditions in rural areas.'),
('Resource Allocation', 'Increased funding needed for
