# 🚀 Spring Boot + MySQL Dockerized Application

This project demonstrates how to containerize a Spring Boot application and connect it with a MySQL database using Docker.

---

## 🛠️ Tech Stack

* Java 21
* Spring Boot
* MySQL 8
* Docker
* Maven

---

## 📌 Project Architecture
```bash
Developer → GitHub → Jenkins → Docker Build → Docker Hub → AWS EC2 → Run Container
```
---


## 📂 Project Structure
```bash
.
├── Dockerfile
├── docker-compose.yml
├── Jenkinsfile
├── pom.xml
└── src/```


---
## ⚙️ Prerequisites

Make sure you have:
```bash
AWS Account (Free Tier)
EC2 Instance (Amazon Linux / Ubuntu)
Docker Installed
Jenkins Installed
Git Installed
Docker Hub Account
```
---
## ☁️ Step 1: Launch AWS EC2
Go to AWS Console
```bash
Launch EC2 Instance:
OS: Amazon Linux 2023 / Ubuntu
Instance Type: t2.micro (Free tier)
Allow ports in Security Group:
22 (SSH)
8080 (App)
8081 (App external)
8080 (Jenkins)
3306 (MySQL if needed)
```


---
## 🔐 Step 2: Connect to EC2

```bash
ssh -i your-key.pem ec2-user@your-public-ip
```
---

## 🐳 Step 3: Install Docker
```bash
Amazon Linux:
sudo yum update -y
sudo yum install docker -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ec2-user
```
```bash
Ubuntu:
sudo apt update
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
```
👉 Re-login after adding docker group
---

## 🐙 Step 4: Install Git
```bash
sudo yum install git -y     # Amazon Linux
sudo apt install git -y     # Ubuntu
```
---

## 🔄 Step 5: Install Jenkins
```bash
sudo yum install java-17-amazon-corretto -y

sudo wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/redhat-stable/jenkins.repo

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

sudo yum install jenkins -y

sudo systemctl start jenkins
sudo systemctl enable jenkins
```
Access Jenkins:
```bash
http://<EC2-PUBLIC-IP>:8080
```

Get admin password:
```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```
---

## ⚙️ Step 6: Configure Jenkins
```bash
Install Plugins:
Docker Pipeline
Git
Maven Integration
Configure Tools:
Maven → Name: MAVEN```

---
## 🔑 Step 7: Add Docker Hub Credentials

Go to:
```bash
Manage Jenkins → Credentials
```
Add:
ID: docker
Username: DockerHub username
Password: DockerHub password
---
## 📥 Step 8: Create Jenkins Pipeline

```bash
New Item → Pipeline
Add your Jenkinsfile
Save & Build```
---

## 🐳 Step 9: Docker Setup (Manual - Optional)
Run MySQL Container
```bash
docker run -d \
--name mysql-container \
-e MYSQL_ROOT_PASSWORD=root \
-e MYSQL_DATABASE=devops_db \
-p 3307:3306 \
mysql:8
```
---
## 🐳 Step 10: Docker Compose (Recommended)
```bash
docker-compose up -d
```
---
## 🔄 CI/CD Pipeline Stages
```bash
✅ Clone Code from GitHub
🔨 Build JAR using Maven
🐳 Build Docker Image
🔐 Login to Docker Hub
📤 Push Image
🚀 Deploy Container
```
```

---
▶️ Access Application
```bash
http://<EC2-PUBLIC-IP>:8081
```
---
🧪 Useful Commands
Stop all containers
```bash
docker stop $(docker ps -q)
```
---
Remove all containers
```bash
docker rm -f $(docker ps -aq)
```
---
Remove images
```bash
docker rmi -f $(docker images -q)
```
---
Remove volumes
```bash
docker volume prune -f
```
---
⚠️ Common Issues & Fixes
```bash
❌ Docker Permission Denied
sudo usermod -aG docker ec2-user
❌ Port Already in Use
sudo lsof -i :8081
❌ MySQL Connection Issue
Ensure container name matches:
mysql-container
Check network:
docker network ls
```

---
📌 Environment Variables Used
```bash
SPRING_DATASOURCE_URL=jdbc:mysql://mysql-container:3306/devops_db
SPRING_DATASOURCE_USERNAME=root
SPRING_DATASOURCE_PASSWORD=root
```

---
🎯 Key Features
```bash
✔️ Fully Automated CI/CD Pipeline
✔️ Dockerized Spring Boot Application
✔️ MySQL Container Integration
✔️ AWS Deployment Ready
✔️ Production-Level Setup
```

---
## 📌 Notes

* Ensure Docker is running
* Ensure ports 8081 and 3307 are free
* Use correct database name (`devops_db`)

---

## ⭐ Author

Sanket Mahajan
