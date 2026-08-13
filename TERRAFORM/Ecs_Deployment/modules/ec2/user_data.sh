#!/bin/bash

set -e

echo "===== Starting EC2 User Data ====="

# Update packages
dnf update -y

# Install Git, Docker and curl
dnf install -y git docker curl

# Enable and start Docker
systemctl enable docker
systemctl start docker

echo "===== Docker installed ====="

# Install Docker Compose plugin
mkdir -p /usr/local/lib/docker/cli-plugins

curl -SL \
  https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64 \
  -o /usr/local/lib/docker/cli-plugins/docker-compose

chmod +x /usr/local/lib/docker/cli-plugins/docker-compose

echo "===== Docker Compose installed ====="

# Verify Docker Compose
docker compose version

# Clone application
cd /home/ec2-user

git clone ${GITHUB_REPO} Employee_management_system

chown -R ec2-user:ec2-user /home/ec2-user/Employee_management_system

cd /home/ec2-user/Employee_management_system

echo "===== Application cloned ====="

# Create backend environment file
cat > backend/.env <<EOF
PORT=5000
DB_HOST=${DB_HOST}
DB_USER=${DB_USER}
DB_PASSWORD=${DB_PASSWORD}
DB_NAME=${DB_NAME}
DB_PORT=3306
EOF

echo "===== Backend environment configured ====="

# Build application
docker compose build

echo "===== Docker images built ====="

# Start application
docker compose up -d

echo "===== Employee Management System started ====="

# Show running containers
docker ps

echo "===== EC2 User Data Completed ====="