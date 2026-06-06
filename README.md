# 🗄️ Company Database System

> **A simple relational database built using MySQL to simulate a real company structure including employees, departments, projects, and work tracking.**  
> *This project focuses on practicing SQL basics, joins, subqueries, and data analysis.*

[![Portfolio](https://img.shields.io/badge/Portfolio-Visit-blue?style=for-the-badge)](https://abdallah-thyab.netlify.app/) [![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0077B5?style=for-the-badge&logo=linkedin)](https://www.linkedin.com/in/abdallah-thyab-dev)

---

## 📌 Overview

This project is a company database system that manages employees, departments, projects, dependents, and work assignments.

It is designed for learning SQL and practicing real-world database queries.

---

## ✨ Features

- 👨‍💼 Manage employees and their information
- 🏢 Manage departments and managers
- 📊 Track employee salaries and department data
- 📁 Manage projects and assignments
- ⏱️ Track working hours on projects
- 👨‍👩‍👧 Manage employee dependents
- 📈 Run analytical SQL queries (avg, sum, count, etc.)

---

## 🏗️ Database Structure

### Main Tables

- **EMPLOYEE** → employee personal data, salary, department, supervisor  
- **DEPARTMENT** → department name and manager  
- **PROJECT** → project details and department  
- **WORKS_ON** → employee hours on projects  
- **DEPENDENT** → employee family members  
- **DEPT_LOCATIONS** → department locations  

---

## 🔗 Relationships

- One department has many employees  
- One department has many projects  
- One employee can have many dependents  
- Employees work on many projects  
- Each employee belongs to one department  

---

## 🛠️ SQL Concepts Used

- CREATE DATABASE / CREATE TABLE
- INSERT / UPDATE / DELETE
- SELECT queries
- WHERE conditions
- JOINs
- GROUP BY / HAVING
- Aggregate functions (SUM, COUNT, AVG)
- Subqueries

---

## 📊 What the Project Can Do

- Show employee details
- Find employees with high salary
- Count employees per department
- Show department managers
- Calculate working hours per project
- Find employees above average salary
- Analyze company data using SQL queries

---

## 🎯 Purpose

This project was created for learning SQL and practicing how to:

- Design relational databases
- Write SQL queries
- Work with real-world data structures
- Use joins and subqueries effectively

---

## 👤 Author

**Abdallah Thyab**

[![Portfolio](https://img.shields.io/badge/Portfolio-Visit-blue?style=for-the-badge)](https://abdallah-thyab.netlify.app/)  
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0077B5?style=for-the-badge&logo=linkedin)](https://www.linkedin.com/in/abdallah-thyab-dev)
