# Employee Reimbursement Portal

A comprehensive Rails-based web application for managing employee reimbursement claims. This portal enables employees to submit bills for reimbursement and allows administrators to review, approve, or reject these claims efficiently.

## 📋 Table of Contents

- [Features](#features)
- [Tech Stack](#tech-stack)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Database Setup](#database-setup)
- [Running the Application](#running-the-application)
- [Authentication & Authorization](#authentication--authorization)
- [API Endpoints](#api-endpoints)
- [Database Schema](#database-schema)
- [Usage Guide](#usage-guide)
- [Project Structure](#project-structure)
- [Contributing](#contributing)

## ✨ Features

### For Employees (Customers)
- Secure login with email and password
- Submit reimbursement bills (Food, Travel, Others)
- View submitted bills and their status
- Track approval/rejection of claims

### For Administrators
- Admin login with separate authentication
- View all employee reimbursement claims
- Approve or reject bills
- Manage employees and their details
- Manage departments
- View comprehensive statistics and reports

### Technical Features
- OAuth2 token-based authentication using Doorkeeper
- Role-based access control (Admin/Employee)
- RESTful API architecture
- Modern UI with responsive design
- Real-time form validation
- Secure password management with Devise

## 🛠 Tech Stack

- **Framework**: Ruby on Rails 7.1.3
- **Database**: PostgreSQL
- **Authentication**: Devise
- **OAuth**: Doorkeeper
- **Frontend**: Hotwire (Turbo + Stimulus)
- **Styling**: Custom CSS
- **JavaScript**: ES6+ with Import Maps
- **Server**: Puma

## 📦 Prerequisites

Before you begin, ensure you have the following installed:

- **Ruby** 3.2.2 or higher
- **Rails** 7.1.3 or higher
- **PostgreSQL** 12 or higher
- **Node.js** (for JavaScript dependencies)
- **Bundler** gem
- **Git**