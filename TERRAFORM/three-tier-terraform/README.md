# AWS Three-Tier Employee Management System

A three-tier web application deployed on AWS using **Terraform modules**, **Docker**, **React**, **Node.js/Express**, **Amazon RDS MySQL**, and an **Application Load Balancer**.

The project demonstrates how to provision AWS infrastructure using Terraform modules and deploy a Dockerized frontend and backend application on a private EC2 instance.

---

# Project Overview

This project implements an **Employee Management System** using a three-tier AWS architecture.

The application consists of:

- **Frontend:** React + Vite
- **Backend:** Node.js + Express
- **Database:** Amazon RDS MySQL
- **Containerization:** Docker + Docker Compose
- **Infrastructure:** AWS + Terraform
- **Load Balancing:** Application Load Balancer
- **EC2 Management:** AWS Systems Manager Session Manager

The application is accessible from the internet through the **Application Load Balancer URL**.

The EC2 instance and RDS database are deployed in private subnets.

---

# Requirements

The project was created according to the following requirements:

### Infrastructure

- VPC
- 2 Public Web Subnets
- 2 Private Application Subnets
- 2 Private Database Subnets
- Internet Gateway
- NAT Gateway
- Application Load Balancer
- Private EC2 instance
- Amazon RDS MySQL

### Security

Separate Security Groups are used for:

- Application Load Balancer
- Application/EC2
- Database/RDS

Traffic between the layers is restricted.

### Application

The application contains:

- React frontend
- Node.js/Express backend
- Amazon RDS MySQL database

### Deployment

- Terraform modules
- Docker
- Docker Compose
- EC2 User Data
- AWS Systems Manager

---

# Architecture

## Three-Tier Architecture

```text
                              INTERNET
                                  |
                                  |
                            HTTP / HTTPS
                                  |
                                  v
                    +-------------------------+
                    | Application Load        |
                    | Balancer (ALB)          |
                    |                         |
                    | Public Subnet 1         |
                    | Public Subnet 2         |
                    +------------+------------+
                                 |
                                 | HTTP :80
                                 |
                                 v
             +-----------------------------------------+
             |       PRIVATE APPLICATION LAYER         |
             |                                         |
             |  Application Subnet 1                   |
             |  Application Subnet 2                   |
             |                                         |
             |             EC2 Instance                |
             |                                         |
             |        Docker Compose                   |
             |                                         |
             |   +-------------------------------+     |
             |   | React + Nginx                 |     |
             |   | Port 80                       |     |
             |   +---------------+---------------+     |
             |                   |                     |
             |                  /api                   |
             |                   |                     |
             |   +---------------v---------------+     |
             |   | Node.js + Express             |     |
             |   | Port 5000                     |     |
             |   +---------------+---------------+     |
             +-------------------|---------------------+
                                 |
                                 | MySQL :3306
                                 |
                                 v
             +-----------------------------------------+
             |         PRIVATE DATABASE LAYER          |
             |                                         |
             |  Database Subnet 1                      |
             |  Database Subnet 2                      |
             |                                         |
             |           Amazon RDS MySQL              |
             |                 :3306                   |
             +-----------------------------------------+
```

---

# Application URL

The Employee Management System is accessible through the public **Application Load Balancer**.

### Live Application

[Open Employee Management System](http://three-tier-alb-881728508.ap-south-1.elb.amazonaws.com)

The application is accessed through the public Application Load Balancer, while the EC2 instance hosting the Dockerized application remains in a private application subnet.

---

# Application Screenshots

## Home Page

The following screenshot shows the Employee Management System home page successfully running through the AWS Application Load Balancer.

![Employee Management System - Home Page](docs/screenshots/home-page.png)

---

## Employees Page

The Employees page retrieves employee information from the Node.js backend, which communicates with the Amazon RDS MySQL database.

The application successfully displays employee records stored in the RDS database.

![Employee Management System - Employees](docs/screenshots/employees-page.png)

---

## Add Employee

The application also supports adding new employees.

When a new employee is submitted, the React frontend sends the request to the Node.js/Express backend through the Nginx reverse proxy. The backend stores the employee information in Amazon RDS MySQL.

The application displays a confirmation message after the employee is successfully added.

![Employee Management System - Add Employee](docs/screenshots/add-employee.png)

---

# Application Request Flow

```text
                         INTERNET
                            |
                            v
              Application Load Balancer
                            |
                            | HTTP :80
                            v
                    Private EC2 Instance
                            |
                     Docker Compose
                            |
              +-------------+-------------+
              |                           |
              v                           v
        React + Nginx              Node.js + Express
          Frontend                     Backend
              |                           |
              | /api                      |
              +-------------------------->|
                                          |
                                          | MySQL :3306
                                          v
                                  Amazon RDS MySQL
```

---

# Network Architecture

The AWS VPC uses the following CIDR structure:

```text
VPC: 10.0.0.0/16

Public Subnets:
├── Public Subnet 1: 10.0.1.0/24
└── Public Subnet 2: 10.0.2.0/24

Private Application Subnets:
├── Application Subnet 1: 10.0.3.0/24
└── Application Subnet 2: 10.0.4.0/24

Private Database Subnets:
├── Database Subnet 1: 10.0.5.0/24
└── Database Subnet 2: 10.0.6.0/24
```

The infrastructure is distributed across two Availability Zones:

- `ap-south-1a`
- `ap-south-1b`

---

# Security Group Architecture

Traffic between the three tiers is restricted using separate Security Groups.

### ALB Security Group

Allows:

- HTTP `80` from the internet
- HTTPS `443` from the internet

### Application Security Group

Allows:

- HTTP `80` only from the ALB Security Group

The EC2 instance does not accept HTTP traffic directly from the internet.

### Database Security Group

Allows:

- MySQL `3306` only from the Application Security Group

The RDS database is deployed privately and is not publicly accessible.

Traffic flow:

```text
Internet
   |
   | HTTP / HTTPS
   v
ALB Security Group
   |
   | HTTP :80
   v
Application Security Group
   |
   | MySQL :3306
   v
Database Security Group
```

---

# Terraform Module Structure

All major AWS infrastructure components are organized using Terraform modules.

```text
three-tier-terraform/
│
├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
├── data.tf
├── terraform.tfvars
├── README.md
│
├── modules/
│   ├── networking/
│   ├── security-group/
│   ├── alb/
│   ├── ec2/
│   ├── iam/
│   ├── keypair/
│   └── rds/
│
└── docs/
    └── screenshots/
        ├── home-page.png
        ├── employees-page.png
        └── add-employee.png
```

---

# AWS Resources

The Terraform configuration provisions the following AWS resources:

### Networking

- VPC
- Internet Gateway
- NAT Gateway
- Public Route Table
- Private Application Route Table
- Database Route Table
- 2 Public Subnets
- 2 Private Application Subnets
- 2 Private Database Subnets

### Load Balancing

- Application Load Balancer
- Target Group
- ALB Listener
- Target Group Attachment

### Compute

- EC2 instance
- IAM Instance Profile
- AWS Systems Manager access

### Database

- Amazon RDS MySQL
- RDS Subnet Group

### Security

- ALB Security Group
- Application Security Group
- Database Security Group

---

# Docker Architecture

The application is deployed on the private EC2 instance using Docker Compose.

```text
EC2 Instance
     |
     v
Docker Compose
     |
     +----------------------------+
     |                            |
     v                            v
Frontend Container          Backend Container
React + Nginx               Node.js + Express
Port 80                     Port 5000
     |                            |
     +------------+---------------+
                  |
                  v
             Amazon RDS
             MySQL :3306
```

The frontend container uses **Nginx** as a reverse proxy.

API requests are forwarded through:

```text
/api/*
   |
   v
Nginx
   |
   v
backend:5000
```

---

# EC2 User Data

EC2 User Data is used to automate application deployment.

The User Data script performs the following tasks:

1. Updates the operating system packages.
2. Installs Git, Docker, and curl.
3. Starts and enables Docker.
4. Installs the Docker Compose plugin.
5. Clones the application source code from GitHub.
6. Creates the backend `.env` file.
7. Configures the Amazon RDS connection.
8. Builds the Docker images.
9. Starts the application using Docker Compose.

This allows the application environment to be configured automatically when the EC2 instance is created.

---

# Database

The application uses **Amazon RDS MySQL** as its persistent database.

The backend connects to RDS using environment variables:

```text
DB_HOST
DB_USER
DB_PASSWORD
DB_NAME
DB_PORT
```

The database connection flow is:

```text
React Frontend
      |
      v
Node.js / Express Backend
      |
      | MySQL :3306
      v
Amazon RDS MySQL
```

Employee information such as:

- Employee ID
- Name
- Email
- Department
- Salary
- Created Date

is stored in the RDS database.

---

# Deployment Process

The infrastructure is deployed using Terraform.

### Initialize Terraform

```bash
terraform init
```

### Validate the configuration

```bash
terraform validate
```

### Review the execution plan

```bash
terraform plan
```

### Deploy the infrastructure

```bash
terraform apply
```

Enter:

```text
yes
```

when prompted.

After Terraform completes, the AWS infrastructure is created.

---

# Application Deployment

The EC2 instance is deployed in a private application subnet.

The application is then deployed using Docker Compose.

The Docker Compose configuration contains:

- React + Nginx frontend
- Node.js + Express backend

The frontend is exposed on port `80`.

The backend runs internally on port `5000`.

The Application Load Balancer forwards HTTP traffic to the EC2 instance.

---

# Application Verification

The application was verified using the following tests.

### Check running containers

```bash
docker ps
```

Expected containers:

```text
employee-frontend
employee-backend
```

### Check backend logs

```bash
docker logs employee-backend
```

Expected:

```text
Server running on port 5000
Connected to MySQL Database
```

### Test frontend

```bash
curl http://localhost
```

### Test backend API

```bash
curl http://localhost/api/employees
```

The API should return employee records stored in Amazon RDS MySQL.

---

# AWS Systems Manager

The EC2 instance is deployed in a private subnet without requiring direct SSH access.

AWS Systems Manager Session Manager is used to connect to the EC2 instance.

This provides secure management access without exposing SSH port `22` to the internet.

---

# Project Features

The Employee Management System supports:

- View employees
- Add employees
- Edit employees
- Delete employees
- Search employees
- Display total employees
- Display departments
- Display total salary
- Persistent storage using Amazon RDS MySQL

---

# Technology Stack

| Layer | Technology |
|---|---|
| Frontend | React + Vite |
| Web Server | Nginx |
| Backend | Node.js + Express |
| Database | Amazon RDS MySQL |
| Containerization | Docker |
| Container Orchestration | Docker Compose |
| Infrastructure | Terraform |
| Cloud | AWS |
| Load Balancer | Application Load Balancer |
| Compute | Amazon EC2 |
| Management | AWS Systems Manager |
| Version Control | Git + GitHub |

---

# Project Deliverables

The project includes:

- Terraform modular infrastructure
- AWS three-tier architecture
- React frontend
- Node.js/Express backend
- Amazon RDS MySQL database
- Dockerfiles
- Docker Compose configuration
- EC2 User Data deployment
- Security Groups
- Application Load Balancer
- Architecture documentation
- Application screenshots
- Working application URL

---

# Conclusion

This project demonstrates the deployment of a complete **three-tier web application on AWS** using Infrastructure as Code with **Terraform modules**.

The architecture separates the application into:

1. **Web Layer** – Application Load Balancer
2. **Application Layer** – Private EC2 running Dockerized React/Nginx and Node.js/Express
3. **Database Layer** – Private Amazon RDS MySQL

Security Groups restrict communication between each layer, while NAT Gateway provides outbound internet access for resources in the private subnets.

The final application is accessible through the AWS Application Load Balancer while the application server and database remain isolated inside private subnets.