# Inception

This project aims to broaden the knowledge of system administration through the use of Docker technology. I virtualized several Docker images by creating them in a personal virtual machine.

## Project Structure

The project consists of three Docker containers:
- NGINX: Web server with TLSv1.2/TLSv1.3 acting as the sole entry point
- WordPress: PHP-FPM installation running WordPress
- MariaDB: Database server for WordPress

All containers are built using Alpine Linux and are connected via a Docker network.

## Environment Setup

### 1. Environment Variables

To set up the environment variables:

```bash
# Create your .env file from the example
cp srcs/.env.example srcs/.env
# Edit with your own values
nano srcs/.env
```

### 2. Docker Secrets (Optional but Recommended)

For better security, the project supports Docker secrets:

```bash
# Create secrets directory
mkdir -p secrets

# Create password secrets
echo "your_db_password" > secrets/db_password.txt
echo "your_root_password" > secrets/db_root_password.txt

# Create WordPress credentials
cat > secrets/credentials.txt << EOL
ADMIN_USER=youruser
ADMIN_USER_EMAIL=youruser@42.fr
ADMIN_USER_PASS=your_admin_password
NORMAL_USER=normal
NORMAL_USER_EMAIL=normal@42.fr
NORMAL_USER_PASS=normal_password
EOL
```

### 3. Domain Setup

Add this line to your `/etc/hosts` file:
```
127.0.0.1 yourdomain.42.fr
```

## Usage

```bash
# Set up volume directories and start containers
sudo make

# Stop containers without removing volumes
sudo make stop

# Start previously stopped containers
sudo make start

# Restart all containers
sudo make restart

# View container logs
sudo make logs

# Stop and remove containers
sudo make down

# Clean up everything (images, containers, volumes)
sudo make clean
```

## Accessing the Website

Access the WordPress site at `https://yourdomain.42.fr`
