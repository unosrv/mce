### Install Dokploy using curl

Source: https://docs.dokploy.com/docs/core/installation

This command downloads and executes the Dokploy installation script from the official website. It automates the installation of Dokploy and its dependencies, including Docker if it's not already present. Ensure you have curl installed on your server before running this command.

```bash
curl -sSL https://dokploy.com/install.sh | sh

```

--------------------------------

### Turborepo Nixpacks Environment Variables for Dokploy

Source: https://docs.dokploy.com/docs/core/turborepo

These environment variables configure Nixpacks for building and starting a Turborepo application on Dokploy. They specify the application name, the build command, and the start command, ensuring Turborepo's filtering capabilities are utilized correctly.

```shell
NIXPACKS_TURBO_APP_NAME="web"
NIXPACKS_BUILD_CMD="turbo run build --filter=web"
NIXPACKS_START_CMD="turbo run start --filter=web"
```

--------------------------------

### Example Dokploy Server Setup Command

Source: https://docs.dokploy.com/docs/core/multi-server/instructions

This command is used to set up a remote server for deployments via Dokploy. It should be run once on the remote server. Ensure you have generated an SSH key and added it to Dokploy.

```bash
dokploy setup-server --api-token YOUR_API_TOKEN --dokploy-url https://app.dokploy.com
```

--------------------------------

### Example Application Deployment with Dokploy

Source: https://docs.dokploy.com/docs/core/multi-server/instructions

This example demonstrates how to deploy an application using Dokploy. It specifies the repository, branch, and build path for the application. The deployment process can be monitored via the Logs tab.

```bash
dokploy deploy \
  --repo https://github.com/Dokploy/examples.git \
  --branch main \
  --build-path /astro
```

--------------------------------

### Set Build Command with NixPacks for Astro SSR

Source: https://docs.dokploy.com/docs/core/astro-ssr

This snippet shows how to configure the start command for an Astro SSR application using NixPacks. It ensures the application runs correctly after deployment by specifying the preview command.

```bash
NIXPACKS_START_CMD="pnpm run preview"
```

--------------------------------

### Install Dokploy using Bash Script

Source: https://docs.dokploy.com/docs/core/manual-installation

This Bash script automates the installation of Dokploy on a Linux server. It includes checks for root privileges, OS compatibility, and port conflicts (80, 443). It also handles Docker installation and swarm initialization. The script then deploys Dokploy, PostgreSQL, Redis, and Traefik services using Docker Swarm.

```bash
#!/bin/bash
install_dokploy() {
    if [ "$(id -u)" != "0" ]; then
        echo "This script must be run as root" >&2
        exit 1
    fi
 
    # check if is Mac OS
    if [ "$(uname)" = "Darwin" ]; then
        echo "This script must be run on Linux" >&2
        exit 1
    fi
 
    # check if is running inside a container
    if [ -f "/.dockerenv" ]; then
        echo "This script must be run on Linux" >&2
        exit 1
    fi
 
    # check if something is running on port 80
    if ss -tulnp | grep ':80 ' >/dev/null; then
        echo "Error: something is already running on port 80" >&2
        exit 1
    fi
 
    # check if something is running on port 443
    if ss -tulnp | grep ':443 ' >/dev/null; then
        echo "Error: something is already running on port 443" >&2
        exit 1
    fi
 
    command_exists() {
      command -v "$@" > /dev/null 2>&1
    }
 
    if command_exists docker;
      then
      echo "Docker already installed"
    else
      curl -sSL https://get.docker.com | sh
    fi
 
    docker swarm leave --force 2>/dev/null
 
    get_ip() {
        local ip=""
        
        # Try IPv4 first
        # First attempt: ifconfig.io
        ip=$(curl -4s --connect-timeout 5 https://ifconfig.io 2>/dev/null)
        
        # Second attempt: icanhazip.com
        if [ -z "$ip" ]; then
            ip=$(curl -4s --connect-timeout 5 https://icanhazip.com 2>/dev/null)
        fi
        
        # Third attempt: ipecho.net
        if [ -z "$ip" ]; then
            ip=$(curl -4s --connect-timeout 5 https://ipecho.net/plain 2>/dev/null)
        fi
 
        # If no IPv4, try IPv6
        if [ -z "$ip" ]; then
            # Try IPv6 with ifconfig.io
            ip=$(curl -6s --connect-timeout 5 https://ifconfig.io 2>/dev/null)
            
            # Try IPv6 with icanhazip.com
            if [ -z "$ip" ]; then
                ip=$(curl -6s --connect-timeout 5 https://icanhazip.com 2>/dev/null)
            fi
            
            # Try IPv6 with ipecho.net
            if [ -z "$ip" ]; then
                ip=$(curl -6s --connect-timeout 5 https://ipecho.net/plain 2>/dev/null)
            fi
        fi
 
        if [ -z "$ip" ]; then
            echo "Error: Could not determine server IP address automatically (neither IPv4 nor IPv6)." >&2
            echo "Please set the ADVERTISE_ADDR environment variable manually." >&2
            echo "Example: export ADVERTISE_ADDR=<your-server-ip>" >&2
            exit 1
        fi
 
        echo "$ip"
    }
 
    advertise_addr="${ADVERTISE_ADDR:-$(get_ip)}"
    echo "Using advertise address: $advertise_addr"
 
    docker swarm init --advertise-addr $advertise_addr
    
     if [ $? -ne 0 ]; then
        echo "Error: Failed to initialize Docker Swarm" >&2
        exit 1
    fi
 
    echo "Swarm initialized"
 
    docker network rm -f dokploy-network 2>/dev/null
    docker network create --driver overlay --attachable dokploy-network
 
    echo "Network created"
 
    mkdir -p /etc/dokploy
 
    chmod 777 /etc/dokploy
 
    docker service create \
    --name dokploy-postgres \
    --constraint 'node.role==manager' \
    --network dokploy-network \
    --env POSTGRES_USER=dokploy \
    --env POSTGRES_DB=dokploy \
    --env POSTGRES_PASSWORD=amukds4wi9001583845717ad2 \
    --mount type=volume,source=dokploy-postgres-database,target=/var/lib/postgresql/data \
    postgres:16
 
    docker service create \
    --name dokploy-redis \
    --constraint 'node.role==manager' \
    --network dokploy-network \
    --mount type=volume,source=redis-data-volume,target=/data \
    redis:7
 
    docker pull traefik:v3.5.0
    docker pull dokploy/dokploy:latest
 
    # Installation
    docker service create \
      --name dokploy \
      --replicas 1 \
      --network dokploy-network \
      --mount type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock \
      --mount type=bind,source=/etc/dokploy,target=/etc/dokploy \
      --mount type=volume,source=dokploy-docker-config,target=/root/.docker \
      --publish published=3000,target=3000,mode=host \
      --update-parallelism 1 \
      --update-order stop-first \
      --constraint 'node.role == manager' \
      -e ADVERTISE_ADDR=$advertise_addr \
      dokploy/dokploy:latest
 
 
    docker run -d \
        --name dokploy-traefik \
        --restart always \
        -v /etc/dokploy/traefik/traefik.yml:/etc/traefik/traefik.yml \
        -v /etc/dokploy/traefik/dynamic:/etc/dokploy/traefik/dynamic \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -p 80:80/tcp \
        -p 443:443/tcp \
        -p 443:443/udp \
        traefik:v3.5.0
 
    docker network connect dokploy-network dokploy-traefik
 
 
    # Optional: Use docker service create instead of docker run
    #   docker service create \

```

--------------------------------

### Docker Compose Service Example

Source: https://docs.dokploy.com/docs/core/docker-compose/utilities

A typical Docker Compose service definition for WordPress. This example illustrates a basic service setup that would benefit from Dokploy's Isolated Deployments feature to prevent naming conflicts when deploying multiple instances.

```yaml
services:
  wordpress:
    image: wordpress:latest
    ports:
      - "80"
```

--------------------------------

### Install Dokploy into Existing Docker Swarm

Source: https://docs.dokploy.com/docs/core/manual-installation

This snippet demonstrates how to install Dokploy into an existing Docker Swarm. It involves creating a network, preparing a directory for configuration, pulling the Dokploy image, and then creating the Dokploy service with specific configurations for mounts, ports, and update behavior.

```shell
docker network create --driver overlay --attachable dokploy-network

mkdir -p /etc/dokploy

chmod -R 777 /etc/dokploy

docker pull dokploy/dokploy:latest

# Installation
docker service create \
  --name dokploy \
  --replicas 1 \
  --network dokploy-network \
  --mount type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock \
  --mount type=bind,source=/etc/dokploy,target=/etc/dokploy \
  --publish published=3000,target=3000,mode=host \
  --update-parallelism 1 \
  --update-order stop-first \
  dokploy/dokploy:latest
```

--------------------------------

### Docker Compose Volume Mount Example

Source: https://docs.dokploy.com/docs/core/troubleshooting

Example of configuring a named volume mount in a Docker Compose file. This snippet shows how to mount a named volume 'my-database' to the '/var/lib/mysql' directory within a container, commonly used for persistent database storage.

```yaml
volumes:
  - my-database:/var/lib/mysql
```

--------------------------------

### Fix Dokploy Database Connection Issue

Source: https://docs.dokploy.com/docs/core/troubleshooting

Addresses a common issue where Dokploy fails to connect to its database due to the startup order. It involves scaling down and then scaling up the Dokploy service to ensure proper initialization.

```bash
docker service scale dokploy=0
# Then
docker service scale dokploy=1
```

--------------------------------

### Configure Gitlab Application for Dokploy

Source: https://docs.dokploy.com/docs/core/gitlab

Steps to create a new Gitlab application to grant Dokploy access to your repositories. This involves setting permissions and obtaining an Application ID and Secret.

```text
1. Go to `https://gitlab.com/-/profile/applications` and click on ` Add New Application`.
2. Set Application Name: eg. `Dokploy-Gitlab-App`.
3. Redirect URI: Copy the `Redirect URI` from Dokploy (e.g., `https://dokploy.com/api/providers/gitlab/callback`).
4. Select Permissions: `api`, `read_user`, `read_repository`.
5. Click on `Save Application`.
6. Copy the `Application ID` and `Secret` from Gitlab and paste it in Dokploy `Gitlab` Modal section.
```

--------------------------------

### Manual Dokploy Upgrade Script

Source: https://docs.dokploy.com/docs/core/manual-installation

This command-line snippet provides a quick way to manually upgrade Dokploy using a curl command to fetch and execute the installation script with the 'update' argument.

```shell
curl -sSL https://dokploy.com/install.sh | sh -s update
```

--------------------------------

### Dokploy Zero Downtime Health Check Example (JSON)

Source: https://docs.dokploy.com/docs/core/applications/zero-downtime

An example JSON configuration for Dokploy's Swarm settings to enable zero-downtime deployments. It uses a 'curl' command to check a '/health' endpoint on port 3000, with specified intervals, timeouts, start periods, and retries. This ensures new container instances are healthy before traffic is directed to them.

```json
{
  "Test": [
    "CMD",
    "curl",
    "-f",
    "http://localhost:3000/health"
  ],
  "Interval": 30000000000,
  "Timeout": 10000000000,
  "StartPeriod": 30000000000,
  "Retries": 3
}
```

--------------------------------

### Restart Traefik Container

Source: https://docs.dokploy.com/docs/core/troubleshooting

Illustrates the command to restart the Traefik container. This is a common solution for minor configuration glitches or when Traefik fails to start correctly.

```bash
docker restart dokploy-traefik
```

--------------------------------

### Adding WWW to a Domain via CNAME Record

Source: https://docs.dokploy.com/docs/core/domains

To add 'www' to your domain, you can configure a CNAME record with your DNS provider. This example shows how to point 'www.example.com' to 'example.com'.

```dns
TYPE: CNAME
NAME: www
VALUE: example.com
```

--------------------------------

### Recreate Dokploy Redis Service

Source: https://docs.dokploy.com/docs/core/troubleshooting

Removes the existing 'dokploy-redis' Docker service and creates a new one. It specifies the network, a volume for data persistence, and uses the 'redis:7' image. Requires Docker Swarm to be initialized.

```bash
docker service rm dokploy-redis

# Create a new dokploy-redis service
  docker service create \
  --name dokploy-redis \
  --constraint 'node.role==manager' \
  --network dokploy-network \
  --mount type=volume,source=redis-data-volume,target=/data \
  redis:7
```

--------------------------------

### Reference Configuration File in Docker Compose

Source: https://docs.dokploy.com/docs/core/troubleshooting

This snippet demonstrates how to reference a configuration file created via Dokploy's 'File Mount' feature within a Docker Compose setup. It shows mounting a file from the '/files' directory (e.g., 'my-config.json') to a specific path inside a container (e.g., '/etc/my-app/config').

```yaml
volumes:
  - ../files/my-config.json:/etc/my-app/config
```

--------------------------------

### Install Dokploy with Docker Swarm

Source: https://docs.dokploy.com/docs/core/manual-installation

This snippet deploys Dokploy as a Docker service within a Docker Swarm. It defines necessary mounts for configuration and Docker socket access, publishes ports for external access, and specifies update configurations. It assumes a pre-existing Docker Swarm network named 'dokploy-network'.

```shell
#!/bin/sh

# Function to install Dokploy
install_dokploy() {
    # ... (previous installation steps omitted for brevity) ...

    # Deploy Dokploy service
    docker service create \
        --name dokploy \
        --replicas 1 \
        --constraint 'node.role==manager' \
        --network dokploy-network \
        --mount type=bind,source=/etc/dokploy/traefik/traefik.yml,target=/etc/traefik/traefik.yml \
        --mount type=bind,source=/etc/dokploy/traefik/dynamic,target=/etc/dokploy/traefik/dynamic \
        --mount type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock \
        --publish mode=host,published=443,target=443 \
        --publish mode=host,published=80,target=80 \
        --publish mode=host,published=443,target=443,protocol=udp \
        traefik:v3.5.0

    # ... (post-installation messages omitted for brevity) ...
}
```

--------------------------------

### Nixpacks Environment Variables Configuration

Source: https://docs.dokploy.com/docs/core/applications/build-type

Nixpacks, the default build type in Dokploy, allows configuration through environment variables prefixed with `NIXPACKS_`. These variables control installation, build, start commands, package installations, caching, and more. You can override default behaviors by setting these variables in the 'Environment Variables' tab.

```text
NIXPACKS_INSTALL_CMD
NIXPACKS_BUILD_CMD
NIXPACKS_START_CMD
NIXPACKS_PKGS
NIXPACKS_APT_PKGS
NIXPACKS_LIBS
NIXPACKS_INSTALL_CACHE_DIRS
NIXPACKS_BUILD_CACHE_DIRS
NIXPACKS_NO_CACHE
NIXPACKS_CONFIG_FILE
NIXPACKS_DEBIAN
```

--------------------------------

### Check Dokploy Container Logs

Source: https://docs.dokploy.com/docs/core/troubleshooting

Provides commands to inspect the logs of individual Dokploy services, including the main UI, PostgreSQL, Redis, and Traefik. This is crucial for identifying specific error messages.

```bash
docker service logs dokploy # Dokploy UI
docker service logs dokploy-postgres # Postgres
docker service logs dokploy-redis # Redis
docker logs dokploy-traefik # Traefik
```

--------------------------------

### Custom Database Backup Script with Docker Exec

Source: https://docs.dokploy.com/docs/core/schedule-jobs

This bash script performs a custom database backup, specifically for ClickHouse in this example, by executing a backup command within its container. It includes placeholders for backup file naming and potential S3 upload. Ensure Docker, ClickHouse client, and AWS CLI (if used) are installed.

```bash
#!/bin/bash
# Backup script for custom database
backup_date=$(date +%Y%m%d_%H%M%S)
backup_file="database_${backup_date}.backup"
 
# search the container name
container_name=$(docker ps --filter "name=clickhouse" --format "{{.Names}}")
 
# Add your backup commands here
docker exec -it $container_name clickhouse-client --query "BACKUP DATABASE mydb TO '/backups/$backup_file'"
 
# Upload to S3 (if needed)
# aws s3 cp /backups/$backup_file s3://your-bucket/backups/
```

--------------------------------

### Dockerfile for Node.js Application

Source: https://docs.dokploy.com/docs/core/applications/going-production

A Dockerfile used to build a production-ready Node.js application. It utilizes multi-stage builds to create a lean final image, installing dependencies with pnpm, building the application, and copying only necessary artifacts.

```dockerfile
FROM node:18-alpine AS base
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable

FROM base AS build
WORKDIR /app
COPY . .
COPY package.json pnpm-lock.yaml ./
RUN --mount=type=cache,id=pnpm,target=/pnpm/store pnpm install --frozen-lockfile
ENV NODE_ENV=production
RUN pnpm run build

FROM base AS dokploy
WORKDIR /app
ENV NODE_ENV=production

# Copy only the necessary files
COPY --from=build /app/dist ./
dist
COPY --from=build /app/package.json ./
package.json
COPY --from=build /app/node_modules ./node_modules

EXPOSE 3000
CMD ["pnpm", "start"]
```

--------------------------------

### Setup Gitea Webhook for Automatic Deployments

Source: https://docs.dokploy.com/docs/core/gitea

Steps to configure a webhook in a Gitea repository to trigger automatic deployments in Dokploy. This involves copying a Webhook URL from Dokploy and configuring it in the Gitea repository's webhook settings, specifically for 'Push Events'.

```text
1. Go to either `Applications` or `Docker Compose` and go to `Deployments` Tab.
2. Copy the `Webhook URL`.
3. Go to your Gitea Account and select the repository.
4. In the left menu, select `Settings` and then `Webhooks`.
5. Click on `Add Webhook`.
6. Set the `URL` to the one you copied in the previous step.
7. In the Trigger section, select `Push Events`.
8. Click on `Add Webhook`.
9. Click on `Save`.
```

--------------------------------

### Configure Docker Swarm Settings (Bash)

Source: https://docs.dokploy.com/docs/core/applications

Provides an example of how Docker Swarm settings might be configured within Dokploy for advanced orchestration. This allows for detailed management of scaling and deployment across multiple nodes in a Docker Swarm cluster.

```bash
# Example Docker Swarm configuration snippet (syntax may vary)
# swarm:
#   replication_factor: 3
#   update_config:
#     parallelism: 1
```

--------------------------------

### Set up Gitlab Webhook for Automatic Deployments

Source: https://docs.dokploy.com/docs/core/gitlab

Instructions to configure a webhook in your Gitlab repository to trigger automatic deployments in Dokploy upon push events. This involves copying a webhook URL from Dokploy and setting it in Gitlab.

```text
1. Go to `Applications` or `Docker Compose` in Dokploy and navigate to the `Deployments` Tab.
2. Copy the `Webhook URL`.
3. In your Gitlab repository, go to `Settings` > `Webhooks`.
4. Click `Add Webhook`.
5. Paste the copied `URL`.
6. In the Trigger section, select `Push Events`.
7. Click `Add Webhook` and then `Save`.
```

--------------------------------

### Internal Path Middleware Example

Source: https://docs.dokploy.com/docs/core/domains

The Internal Path middleware adds a specified prefix to the request path before forwarding it to the application container. This is useful when your application expects all requests to start with a particular base path.

```text
Domain: api.dokploy.com
Path: /v1
Internal Path: /backend/api
Request: api.dokploy.com/v1/users
Forwarded to container as: /backend/api/users
```

--------------------------------

### Configure Vite App for Network Accessibility

Source: https://docs.dokploy.com/docs/core/troubleshooting

This configuration snippet for Vite applications enables the development server and preview server to listen on all network interfaces, making the application accessible on the local network. It requires the '@vitejs/plugin-react' plugin. The `host: true` setting is crucial for external network access.

```javascript
import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

export default defineConfig({
	plugins: [react()],
	preview: {
		port: 3000,
		host: true,
	},
	server: {
		host: true,
		port: 3000
	}
});
```

--------------------------------

### Railpack Build Variables Configuration

Source: https://docs.dokploy.com/docs/core/applications/build-type

Railpack, a successor to Nixpacks, offers configurable build variables for managing build and start commands, installing packages (Mise and Apt), and deployment-specific Apt packages. These variables can be set in the 'Environment Variables' tab for fine-grained control over the build and deployment process.

```text
BUILD_CMD
START_CMD
PACKAGES
BUILD_APT_PACKAGES
DEPLOY_APT_PACKAGES
```

--------------------------------

### MongoDB External Connection URL Example

Source: https://docs.dokploy.com/docs/core/databases/connection/mongo-atlas

This example shows the format of an external connection URL for MongoDB, which is used to connect to your database from external tools like Mongo Compass. Ensure you replace placeholder values with your actual credentials and IP address.

```text
mongodb://user:password@1.2.4.5:27017/database
```

--------------------------------

### Docker Compose Domain Port Configuration

Source: https://docs.dokploy.com/docs/core/troubleshooting

Illustrates the recommended approach for configuring ports when adding a domain in Docker Compose. It advises against exposing ports directly and suggests specifying the app's running port, while also showing the incorrect method.

```yaml
services:
  app:
    image: dokploy/dokploy:latest
    ports:
      - 3000
      - 80
```

--------------------------------

### Docker Stack Domain Port Configuration

Source: https://docs.dokploy.com/docs/core/troubleshooting

Shows the correct method for configuring ports with Docker Stack, where ports are exposed automatically. It recommends using the 'expose' directive instead of explicitly listing ports.

```yaml
services:
  app:
    image: dokploy/dokploy:latest
    expose:
      - 3000
```

--------------------------------

### Recreate Dokploy PostgreSQL Service

Source: https://docs.dokploy.com/docs/core/troubleshooting

Removes the existing 'dokploy-postgres' Docker service and creates a new one. It configures PostgreSQL with specified user, database, and password, mounts a volume for data persistence, and uses the 'postgres:16' image. Requires Docker Swarm.

```bash
docker service rm dokploy-postgres

# Create a new dokploy-postgres service
  docker service create \
  --name dokploy-postgres \
  --constraint 'node.role==manager' \
  --network dokploy-network \
  --env POSTGRES_USER=dokploy \
  --env POSTGRES_DB=dokploy \
  --env POSTGRES_PASSWORD=amukds4wi9001583845717ad2 \
  --mount type=volume,source=dokploy-postgres-database,target=/var/lib/postgresql/data \
  postgres:16
```

--------------------------------

### Basic Docker Compose Application Structure

Source: https://docs.dokploy.com/docs/core/docker-compose/domains

This is a foundational Docker Compose file for a multi-service application including frontend, backend, and a database. It defines services, builds, volumes, ports, environment variables, and dependencies. This serves as the starting point before domain configuration.

```yaml
version: "3.8"
 
services:
  frontend:
    build:
      context: ./frontend
      dockerfile: Dockerfile
    volumes:
      - ./frontend:/app
    ports:
      - "3000:3000"
    depends_on:
      - backend
 
  backend:
    build:
      context: ./backend
      dockerfile: Dockerfile
    volumes:
      - ./backend:/app
    ports:
      - "5000:5000"
    environment:
      - DATABASE_URL=postgres://postgres:password@database:5432/mydatabase
    depends_on:
      - database
 
  database:
    image: postgres:13
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: password
      POSTGRES_DB: mydatabase
    volumes:
      - db-data:/var/lib/postgresql/data
 
volumes:
  db-data:

```

--------------------------------

### Docker Compose Volume Mounting Formats

Source: https://docs.dokploy.com/docs/core/troubleshooting

Demonstrates the correct and incorrect ways to define volume mounts in Docker Compose. It highlights that file mounts are stored in the 'files' folder and should use relative paths for correct mounting.

```yaml
volumes:
    - "../files/my-database:/var/lib/mysql" ✅
    - "../files/my-configs:/etc/my-app/config" ✅
```

--------------------------------

### Initialize Docker Swarm with Advertise Address

Source: https://docs.dokploy.com/docs/core/troubleshooting

Command to initialize or re-initialize a Docker Swarm, specifying the address to advertise. This is essential when Docker cannot uniquely identify a system IP address. Replace 'your-ip' with the desired IP address (public or private) for the swarm manager.

```bash
curl -sSL https://dokploy.com/install.sh | ADVERTISE_ADDR=your-ip sh
```

--------------------------------

### Recreate Dokploy Traefik Service (Standalone and Swarm)

Source: https://docs.dokploy.com/docs/core/troubleshooting

Provides commands to remove and recreate the 'dokploy-traefik' service for both standalone Docker and Docker Swarm deployments. It mounts configuration files, the Docker socket, and exposes ports. Uses the 'traefik:v3.5.0' image.

```bash
# If you are using docker standalone traefik
docker rm -f dokploy-traefik

docker run -d \
    --name dokploy-traefik \
    --restart always \
    -v /etc/dokploy/traefik/traefik.yml:/etc/traefik/traefik.yml \
    -v /etc/dokploy/traefik/dynamic:/etc/dokploy/traefik/dynamic \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -p 80:80/tcp \
    -p 443:443/tcp \
    -p 443:443/udp \
    traefik:v3.5.0

docker network connect dokploy-network dokploy-traefik

# If you are using docker service traefik
docker service rm dokploy-traefik

# Create a new dokploy-traefik service
docker run -d \
    --name dokploy-traefik \
    --restart always \
    -v /etc/dokploy/traefik/traefik.yml:/etc/traefik/traefik.yml \
    -v /etc/dokploy/traefik/dynamic:/etc/dokploy/traefik/dynamic \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -p 80:80/tcp \
    -p 443:443/tcp \
    -p 443:443/udp \
    traefik:v3.5.0
```

--------------------------------

### MySQL External Connection URL Format

Source: https://docs.dokploy.com/docs/core/databases/connection/mysql

This is an example of the external connection URL format provided by Dokploy for MySQL databases. It includes the protocol, username, password, host, port, and database name. Ensure all components are correctly filled in for a successful connection.

```text
mysql://user:password@1.2.4.5:3306/database
```

--------------------------------

### Recreate Dokploy Application Service

Source: https://docs.dokploy.com/docs/core/troubleshooting

Removes the existing 'dokploy' Docker service and creates a new one. This includes setting the advertise address (private IP), mounting the Docker socket and configuration directories, binding a volume for Docker configuration, and publishing the application port. Uses the 'dokploy/dokploy:latest' image. Requires Docker Swarm.

```bash
docker service rm dokploy

# Create a new dokploy service

# We need the advertise address to be set which is the Private IP of your server, you can get it by running the following command:

# Run this command to get the private IP of your server:

# Copy this value and paste in the ADVERTISE_ADDR variable:
ip addr show | grep -E "inet (192\.168\. |10\.|172\.1[6-9]\.|172\.2[0-9]\.|172\.3[0-1]\.)" | head -n1 | awk '{print $2}' | cut -d/ -f1

# Create the dokploy service
docker service create \
  --name dokploy \
  --replicas 1 \
  --network dokploy-network \
  --mount type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock \
  --mount type=bind,source=/etc/dokploy,target=/etc/dokploy \
  --mount type=volume,source=dokploy-docker-config,target=/root/.docker \
  --publish published=3000,target=3000,mode=host \
  --update-parallelism 1 \
  --update-order stop-first \
  --constraint 'node.role == manager' \
  -e ADVERTISE_ADDR="Eg: 192.168.1.100" \
  dokploy/dokploy:latest
```

--------------------------------

### Modify Traefik Settings (Bash)

Source: https://docs.dokploy.com/docs/core/applications

Shows an example of modifying Traefik settings within Dokploy. Traefik is used here to manage HTTP request handling, routing, and other network-related configurations for the application.

```bash
# Example Traefik configuration snippet
# traefik:
#   entrypoints:
#     - websecure
#   routers:
#     my-app-router:
#       rule: "Host(`app.yourdomain.com`)"
```

--------------------------------

### Correct Traefik Configuration for PassHostHeader

Source: https://docs.dokploy.com/docs/core/troubleshooting

Compares an incorrect Traefik configuration snippet with the correct version, specifically highlighting the placement of the `passHostHeader` directive. This is essential for ensuring Traefik routes requests properly to services.

```yaml
http:
  routers:
    dokploy-router-app:
      rule: Host(`my-domain.com`)
      service: dokploy-service-app
      entryPoints:
        - web
      middlewares:
        - redirect-to-https
    dokploy-router-app-secure:
      rule: Host(`my-domain.com`)
      service: dokploy-service-app
      entryPoints:
        - websecure
      tls:
        certResolver: letsencrypt
  services:
    dokploy-service-app:
      loadBalancer:
        servers:
          - url: http://dokploy:3000
          - passHostHeader: true
```

```yaml
http:
  routers:
    dokploy-router-app:
      rule: Host(`my-domain.com`)
      service: dokploy-service-app
      entryPoints:
        - web
      middlewares:
        - redirect-to-https
    dokploy-router-app-secure:
      rule: Host(`my-domain.com`)
      service: dokploy-service-app
      entryPoints:
        - websecure
      tls:
        certResolver: letsencrypt
  services:
    dokploy-service-app:
      loadBalancer:
        servers:
          - url: http://dokploy:3000
        passHostHeader: true
```

--------------------------------

### Restart SSH Service (Linux)

Source: https://docs.dokploy.com/docs/core/multi-server/ec2-instructions

Restarts the SSH daemon to apply configuration changes. This command is typically used after modifying SSH server settings, such as enabling root login.

```shell
sudo systemctl restart sshd
```

--------------------------------

### Strip Path Middleware Example

Source: https://docs.dokploy.com/docs/core/domains

The Strip Path middleware removes a specified path prefix from the request before forwarding it to the application container. This is ideal when you want to use prefixes for public URLs but your application requires clean, unprefixed paths.

```text
Domain: app.dokploy.com
Path: /dashboard
Strip Path: Enabled
Request: app.dokploy.com/dashboard/settings
Forwarded to container as: /settings
```

--------------------------------

### Configure Docker Compose Volumes for Applications

Source: https://docs.dokploy.com/docs/core/volume-backups

Defines volumes within a docker-compose.yml file for multi-container applications. This setup ensures that data persistence is handled through Docker's volume management, allowing Dokploy to back up these named volumes.

```yaml
services:
  app:
    image: dokploy/dokploy:latest
    volumes:
      - my-volume:/app/data

volumes:
  my-volume:

```

--------------------------------

### Example Telegram Chat ID Format

Source: https://docs.dokploy.com/docs/core/telegram

This snippet shows the typical format for a Telegram Chat ID. This ID is used to specify the recipient of messages sent by your Telegram bot, whether it's a direct user chat or a group/channel.

```text
123456789
```

--------------------------------

### Automate Docker Cleanup with Bash Script

Source: https://docs.dokploy.com/docs/core/schedule-jobs

This bash script automatically cleans up unused Docker containers using `docker system prune`. It's suitable for scheduling on remote servers or the Dokploy server. Ensure Docker is installed on the target system.

```bash
#!/bin/bash
docker system prune --force
```

--------------------------------

### Prune Docker System Resources

Source: https://docs.dokploy.com/docs/core/troubleshooting

These Docker commands are used to free up disk space by removing unused data. 'docker system prune -a' removes all stopped containers, networks not used by at least one container, all dangling images, and all build cache. 'docker builder prune -a' removes all unused build cache. 'docker image prune -a' removes all unused images.

```bash
docker system prune -a
docker builder prune -a
docker image prune -a
```

--------------------------------

### Example Telegram Bot Token Format

Source: https://docs.dokploy.com/docs/core/telegram

This snippet illustrates the expected format for a Telegram Bot Token, which is a unique identifier required to connect your bot to the Telegram API. It typically consists of a numeric ID followed by a colon and an alphanumeric string.

```text
123456789:ABCdefGHIjklMNOPqrstUVWXYZ
```

--------------------------------

### Traefik Network Connection Errors on Restart

Source: https://docs.dokploy.com/docs/core/troubleshooting

Log output indicating Traefik's normal behavior when restarting, specifically the 'use of closed network connection' errors. These messages are informational and signify that Traefik is correctly closing existing connections before establishing new ones during its restart process. No action is typically required.

```log
05/23/25, 12:21:12 PM info 2025-05-23T09:21:12Z ERR: error="accept tcp [::]:443: use of closed network connection" entryPointName=websecure
05/23/25, 12:21:12 PM info 2025-05-23T09:21:12Z ERR: error="accept tcp [::]:9000: use of closed network connection" entryPointName=traefik
05/23/25, 12:21:12 PM info 2025-05-23T09:21:12Z ERR: error="accept tcp [::]:80: use of closed network connection" entryPointName=web
05/23/25, 12:21:12 PM info 2025-05-23T09:21:12Z ERR: error="close tcp [::]:9000: use of closed network connection" entryPointName=traefik
05/23/25, 12:21:12 PM info 2025-05-23T09:21:12Z ERR: error="close tcp [::]:443: use of closed network connection" entryPointName=websecure
05/23/25, 12:21:12 PM info 2025-05-23T09:21:12Z ERR: error="close tcp [::]:80: use of closed network connection" entryPointName=web
```

--------------------------------

### AWS S3 IAM Policy Configuration

Source: https://docs.dokploy.com/docs/core/aws-s3

This JSON policy grants necessary permissions for S3 bucket and object actions, including listing buckets and performing get, put, and delete operations on objects. Ensure you replace 'bucket-name' with your actual bucket name.

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowListBucket",
      "Effect": "Allow",
      "Action": "s3:ListBucket",
      "Resource": "arn:aws:s3:::bucket-name"
    },
    {
      "Sid": "AllowBucketObjectActions",
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:PutObject",
        "s3:DeleteObject"
      ],
      // Make sure to set the name of your bucket
      "Resource": "arn:aws:s3:::bucket-name/*"
    }
  ]
}
```

--------------------------------

### Docker Swarm Health Check Configuration (JSON)

Source: https://docs.dokploy.com/docs/core/applications/zero-downtime

This JSON configuration defines health check parameters for Docker Swarm services. It specifies commands to test service health, intervals between tests, timeouts, start periods, and retry counts. This is used within Dokploy's advanced settings to manage zero-downtime deployments.

```json
{
  "Test": [
    "CMD",
    "curl",
    "-f",
    "http://localhost:3000/api/health"
  ],
  "Interval": 30000000000,
  "Timeout": 10000000000,
  "StartPeriod": 30000000000,
  "Retries": 3
}
```

--------------------------------

### Configure Storage Volumes (Bash)

Source: https://docs.dokploy.com/docs/core/applications

Illustrates the configuration of storage volumes for data persistence in Dokploy applications. This includes options for creating Volumes, Binds, and File Mounts to ensure data survives deployments and restarts.

```bash
# Example volume configuration for data persistence
# volumes:
#   - name: app-data
#     mountPath: /app/data
#     type: volume
```

--------------------------------

### Basic Docker Compose Configuration

Source: https://docs.dokploy.com/docs/core/docker-compose/example

This is a basic Docker Compose file configuration for a Next.js application. It defines services, build contexts, environment variables, restart policies, ports, and a custom network. Note that it uses an external network named `my_network`.

```yaml
version: "3"

services:
  next-app:
    build:
      context: ./next-app
      dockerfile: prod.Dockerfile
      args:
        ENV_VARIABLE: ${ENV_VARIABLE}
        NEXT_PUBLIC_ENV_VARIABLE: ${NEXT_PUBLIC_ENV_VARIABLE}
    restart: always
    ports:
      - 3000:3000
    networks:
      - my_network
networks:
  my_network:
    external: true
```

--------------------------------

### Configure Astro Deployment with Nixpacks - Dokploy

Source: https://docs.dokploy.com/docs/core/astro

This configuration outlines the necessary settings for deploying an Astro application using Nixpacks on Dokploy. It specifies the Git repository, branch, build path within the repository, and the directory where the built assets will be published.

```text
Repository: https://github.com/Dokploy/examples.git
Branch: main
Build path: /astro
Publish Directory: ./dist (Nixpacks)
Port: 80
```

--------------------------------

### Docker Compose Configuration with Dokploy and Traefik Integration

Source: https://docs.dokploy.com/docs/core/docker-compose/example

This updated Docker Compose configuration is tailored for Dokploy. It specifies the `dokploy-network`, removes `container_name`, adjusts the port mapping, and includes Traefik labels for routing, SSL, and service discovery. Ensure unique names are used for Traefik routers and services.

```yaml
version: "3"

services:
  next-app:
    build:
      context: ./next-app
      dockerfile: prod.Dockerfile
      args:
        ENV_VARIABLE: ${ENV_VARIABLE}
        NEXT_PUBLIC_ENV_VARIABLE: ${NEXT_PUBLIC_ENV_VARIABLE}
    restart: always
    ports:
      - 3000
    networks:
      - dokploy-network
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.<unique-name>.rule=Host(`your-domain.com`)"
      - "traefik.http.routers.<unique-name>.entrypoints=websecure"
      - "traefik.http.routers.<unique-name>.tls.certResolver=letsencrypt"
      - "traefik.http.services.<unique-name>.loadbalancer.server.port=3000"
networks:
  dokploy-network:
    external: true
```

--------------------------------

### GitHub Actions Workflow for Docker Image Build and Push

Source: https://docs.dokploy.com/docs/core/applications/going-production

This GitHub Actions workflow automates the process of checking out a repository, logging into Docker Hub, and building/pushing a Docker image. It requires Docker Hub credentials to be set as repository secrets.

```yaml
name: Build Docker images

on:
  push:
    branches: ["main"]

jobs:
  build-and-push-dockerfile-image:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v3

      - name: Log in to Docker Hub
        uses: docker/login-action@v2
        with:
          username: ${{ secrets.DOCKERHUB_USERNAME }} # Make sure to add the secrets in your repository in -> Settings -> Secrets (Actions) -> New repository secret
          password: ${{ secrets.DOCKERHUB_TOKEN }}   # Make sure to add the secrets in your repository in -> Settings -> Secrets (Actions) -> New repository secret

      - name: Build and push Docker image
        uses: docker/build-push-action@v4
        with:
          context: .
          file: ./Dockerfile
          push: true
          # Make sure to replace with your own namespace and repository
          tags: |
            namespace/example:latest 
          platforms: linux/amd64     
```

--------------------------------

### Configure Bitbucket Access in Dokploy

Source: https://docs.dokploy.com/docs/core/bitbucket

This section outlines the steps to connect your Bitbucket account to Dokploy. It requires setting up an App Password in Bitbucket with specific permissions and then configuring these credentials within the Dokploy interface. The optional workspace feature is also described.

```text
## Setup Automatic Deployments

You can configure automatic deployments in Dokploy for the Following Services:
  1. **Applications**
  2. **Docker Compose**


The steps are the same for both services.
  1. Go to either `Applications` or `Docker Compose` and go to `Deployments` Tab.
  2. Copy the `Webhook URL`.
  3. Go to your Bitbucket Account and select the repository.
  4. In the left menu, select `Repository Settings` and then `Webhooks`.
  5. Click on `Add Webhook`.
  6. Set any `Title` and the `URL` to the one you copied in the previous step.
  7. In the Trigger section, select `Push Events`.
  8. Click on `Add Webhook`.
  9. Now you have automatic deployments enabled for the selected repository.
```

--------------------------------

### Trigger Deployment via Webhook (Bash)

Source: https://docs.dokploy.com/docs/core/applications

Shows how to trigger a Dokploy deployment using a webhook. This is commonly used for automated deployments when changes are pushed to repositories on platforms like GitHub, Gitea, GitLab, or Bitbucket.

```bash
# Example webhook trigger command (actual URL and payload will vary)
curl -X POST https://your-dokploy-instance.com/webhooks/your-app-id -d '{"ref": "main"}'
```

--------------------------------

### Configure Application Resources (Bash)

Source: https://docs.dokploy.com/docs/core/applications

Shows how to adjust CPU and memory allocation for an application in Dokploy. This is crucial for performance tuning and ensuring the application has adequate resources to run efficiently.

```bash
# Example resource allocation configuration
# resources:
#   limits:
#     cpu: "500m"
#     memory: "256Mi"
```

--------------------------------

### Trigger Dokploy Deployment via GitHub Actions API

Source: https://docs.dokploy.com/docs/core/applications/going-production

This GitHub Actions workflow demonstrates how to trigger a Dokploy deployment after pushing to a GitHub repository. It uses `curl` to make a POST request to the Dokploy API, sending the application ID to initiate the deployment process. Ensure your Dokploy domain, API key, and application ID are correctly configured.

```yaml
name: Build Docker images

on:
  push:
    branches: ["main"]

jobs:
  build-and-push-dockerfile-image:
    runs-on: ubuntu-latest

    steps:
       ...Same as step 7 from the previous example
          
      - name: Trigger Dokploy Deployment
        uses: dokploy/dokploy-action@v1
        run: |
            curl -X 'POST' \
            'https://<your-dokploy-domain>/api/trpc/application.deploy' \
            -H 'accept: application/json' \
            -H 'x-api-key: YOUR-GENERATED-API-KEY' \
            -H 'Content-Type: application/json' \
            -d '{ \
                "json":{
                    "applicationId": "YOUR-APPLICATION-ID"
                }
            }'
```

--------------------------------

### Configure Docker Registry (Bash)

Source: https://docs.dokploy.com/docs/core/applications

Demonstrates the configuration of a Docker registry within Dokploy's advanced settings. This allows users to specify where their application's Docker images should be pulled from for deployment, useful in complex orchestration scenarios.

```bash
# Example configuration for a Docker registry
# This would be part of the Dokploy configuration for the application
# registry: "your-private-registry.com/your-image"
```

--------------------------------

### Configure Network Ports (Bash)

Source: https://docs.dokploy.com/docs/core/applications

Demonstrates how to expose an application's network ports in Dokploy to make it accessible from the internet. This is a fundamental step in deploying web applications.

```bash
# Example port mapping configuration
# ports:
#   - "80:8080" # Map host port 80 to container port 8080
```

--------------------------------

### Configure Custom Domain for Preview Deployments

Source: https://docs.dokploy.com/docs/core/applications/preview-deployments

This snippet shows how to configure a custom domain for preview deployments in Dokploy. It assumes a wildcard DNS record is set up to point to your server's IP address. The generated domains follow a pattern like `preview-${appName}-${uniqueId}.traefik.me`.

```text
*.mydomain.com
```

--------------------------------

### Configure Gitea OAuth2 Application

Source: https://docs.dokploy.com/docs/core/gitea

Instructions for creating an OAuth2 application in Gitea to connect with Dokploy. This involves setting an application name, providing a Redirect URI obtained from Dokploy, and enabling the confidential client option. The generated Client ID and Client Secret are then used in Dokploy.

```text
1. Go to your Gitea instance's settings (e.g., `https://gitea.com/user/settings/applications`) and scroll to the `Create a new OAuth2 Application`.
2. Set Application Name: e.g., `Dokploy-Gitea-App`. Choose any name you want.
3. Redirect URI: Copy the `Redirect URI` from Dokploy. e.g., `https://dokploy.com/api/providers/gitea/callback`.
4. Check Confidential Client
5. Click on `Create Application`.
6. Copy the `Client ID` and `Client Secret` from Gitea and paste them in Dokploy's `Gitea` Modal section.
7. Click on `Configure Gitea App`.
```

--------------------------------

### MariaDB Backup Command

Source: https://docs.dokploy.com/docs/core/databases/restore

This command creates a compressed backup of a MariaDB database. It uses mariadb-dump with specified user, password, and database name, piping the output to gzip for compression.

```shell
mariadb-dump --user='${databaseUser}' --password='${databasePassword}' --databases ${database} | gzip
```

--------------------------------

### Create Domain in Dokploy Panel

Source: https://docs.dokploy.com/docs/core/domains/others

This snippet details the process of creating a new domain entry within the Dokploy panel. It includes specifying the host name, path, the internal container port your application listens on, enabling HTTPS, and selecting 'Let's Encrypt' for SSL certificate generation.

```text
Host: api.dokploy.com
Path: /
Container Port: 3000
HTTPS: ON
Certificate: Let's Encrypt
```

--------------------------------

### Execute Custom Commands in Container (Bash)

Source: https://docs.dokploy.com/docs/core/applications

Illustrates how to configure and execute custom commands within a Dokploy application's container after it has been built and is running. This is part of the advanced settings for specific operational needs.

```bash
# Example of a custom command to run after deployment
# This command might be executed within the application's container
# e.g., 'npm run post-deploy-script'
```

--------------------------------

### Dokploy API: List Projects and Services

Source: https://docs.dokploy.com/docs/core/auto-deploy

This cURL command retrieves a list of all projects and services associated with your Dokploy account. It requires an API token for authentication and is used to identify the applicationId needed for triggering deployments.

```bash
curl -X 'GET' \
  'https://your-domain/api/project.all' \
  -H 'accept: application/json' \
  -H 'x-api-key: <token>'
```

--------------------------------

### Dockerfile Build Configuration Options

Source: https://docs.dokploy.com/docs/core/applications/build-type

When using the Dockerfile build type, Dokploy provides three configurable fields: `Dockerfile Path` (required, specifying the Dockerfile's location), `Docker Context Path` (defining the build context for Docker), and `Docker Build Stage` (allowing selection of a specific build stage within the Dockerfile).

```text
Dockerfile Path
Docker Context Path
Docker Build Stage
```

--------------------------------

### Using Internal Path and Strip Path Together

Source: https://docs.dokploy.com/docs/core/domains

Combining Internal Path and Strip Path middlewares allows for sophisticated routing. Strip Path is applied first, followed by Internal Path. This enables the removal of public-facing prefixes and the addition of internal ones required by the application.

```text
Domain: service.dokploy.com
Path: /public
Strip Path: Enabled
Internal Path: /app/v2
Request: service.dokploy.com/public/api/users
Processing:
  1. Strip Path removes /public: /api/users
  2. Internal Path adds /app/v2: /app/v2/api/users
Final forwarded path: /app/v2/api/users
```

--------------------------------

### Dokploy API - List Applications

Source: https://docs.dokploy.com/docs/core/auto-deploy

Retrieves a list of all applications and their IDs, which is necessary for triggering a deployment via the API.

```APIDOC
## GET /api/project.all

### Description
Retrieves a list of all projects and services, allowing you to identify the `applicationId` for the application you wish to deploy.

### Method
GET

### Endpoint
`/api/project.all`

### Parameters
#### Header Parameters
- **x-api-key** (string) - Required - Your Dokploy API token.

### Request Example
```bash
curl -X 'GET' \
  'https://your-domain/api/project.all' \
  -H 'accept: application/json' \
  -H 'x-api-key: <token>'
```

### Response
#### Success Response (200)
- **applications** (array) - List of application objects, each containing an `applicationId`.
  - **applicationId** (string) - The unique identifier for the application.

#### Response Example
```json
{
  "applications": [
    {
      "applicationId": "string",
      "name": "string"
    }
  ]
}
```
```

--------------------------------

### Update Dokploy Service

Source: https://docs.dokploy.com/docs/core/manual-installation

This function updates the Dokploy service to the latest Docker image. It first pulls the latest 'dokploy/dokploy' image and then updates the running 'dokploy' service to use this new image.

```shell
update_dokploy() {
    echo "Updating Dokploy..."
    
    # Pull the latest image
    docker pull dokploy/dokploy:latest

    # Update the service
    docker service update --image dokploy/dokploy:latest dokploy

    echo "Dokploy has been updated to the latest version."
}
```

--------------------------------

### Format IP Address for URL

Source: https://docs.dokploy.com/docs/core/manual-installation

This bash function takes an IP address as input and formats it for use in a URL. It adds square brackets around the IP if it's an IPv6 address, and returns it as is if it's an IPv4 address.

```shell
format_ip_for_url() {
    local ip="$1"
    if echo "$ip" | grep -q ':'; then
        # IPv6
        echo "[${ip}]"
    else
        # IPv4
        echo "${ip}"
    fi
}
```

--------------------------------

### Using SSH for Private Git Repositories

Source: https://docs.dokploy.com/docs/core/providers

This section details how to configure SSH keys for accessing private Git repositories. It covers generating an SSH key, adding the public key to your Git provider's settings (GitHub, Gitlab, Bitbucket, Gitea, etc.), and using the SSH URL for cloning. This method ensures secure access to private repositories.

```bash
git@github.com:user/repo.git
```

```bash
https://github.com/user/repo.git
```

--------------------------------

### PostgreSQL Backup Command

Source: https://docs.dokploy.com/docs/core/databases/restore

This command is used by Dokploy to create a compressed backup of a PostgreSQL database. It uses pg_dump with specific flags for format, ACLs, ownership, host, user, and password, piping the output to gzip for compression.

```shell
pg_dump -Fc --no-acl --no-owner -h localhost -U ${databaseUser} --no-password '${database}' | gzip
```

--------------------------------

### Define Project-Level Shared Variable

Source: https://docs.dokploy.com/docs/core/variables

This snippet shows how to declare a project-level environment variable, which can be shared across all services within a project. This is useful for common configurations like database connection strings.

```bash
DATABASE_URL=postgresql://postgres:postgres@database:5432/postgres
```

--------------------------------

### MySQL Backup Command

Source: https://docs.dokploy.com/docs/core/databases/restore

This command generates a compressed backup of a MySQL database. It utilizes mysqldump with settings for character set, user, password, transaction isolation, and tablespace handling, compressing the output with gzip.

```shell
mysqldump --default-character-set=utf8mb4 -u 'root' --password='${databaseRootPassword}' --single-transaction --no-tablespaces --quick '${database}' | gzip
```

--------------------------------

### Configure Multiline Environment Variables (Bash)

Source: https://docs.dokploy.com/docs/core/applications

Demonstrates how to assign multiline environment variables within Dokploy. This is useful for sensitive information like private keys that span multiple lines. Ensure the variable is properly enclosed in double quotes.

```bash
ENV_VAR="'here_is_my_private_key'"
```

--------------------------------

### Define Environment-Level Variables

Source: https://docs.dokploy.com/docs/core/variables

This snippet illustrates defining environment-specific variables, such as different database credentials or API keys for a staging environment. These variables are accessible only within the specified environment.

```bash
DATABASE_PASSWORD=staging_secret_password
API_KEY=staging_api_key_12345
```

--------------------------------

### Buildpack Type Selection

Source: https://docs.dokploy.com/docs/core/applications/build-type

Dokploy supports two types of buildpacks for application deployment: Heroku buildpacks, which are compatible with Heroku's platform and allow specifying a version (defaulting to 24), and Paketo buildpacks, which adhere to modern cloud-native standards.

```text
Heroku (default 24)
Paketo
```

--------------------------------

### Dokploy API: Trigger Application Deployment

Source: https://docs.dokploy.com/docs/core/auto-deploy

This cURL command initiates an application deployment via the Dokploy API. It requires your API token and the specific applicationId of the application you wish to deploy. This method is ideal for CI/CD pipelines or custom scripts.

```bash
curl -X 'POST' \
  'https://your-domain/api/application.deploy' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -H 'x-api-key: <token>' \
  -d '{
  "applicationId": "string"
}'
```

--------------------------------

### Reference Project-Level Shared Variable in Service

Source: https://docs.dokploy.com/docs/core/variables

This snippet demonstrates how to reference a project-level shared environment variable within a service's configuration. Dokploy automatically substitutes the variable placeholder with its defined value.

```bash
DATABASE_URL=${{project.DATABASE_URL}}
```

--------------------------------

### External Connection URL Format for PostgreSQL

Source: https://docs.dokploy.com/docs/core/databases/connection/pg-admin

This snippet illustrates the format of the external connection URL provided by Dokploy for PostgreSQL databases. This URL contains the necessary credentials and host information to establish a connection from external tools like pgAdmin. Ensure the port specified is not in use by other services.

```text
postgres://user:password@1.2.4.5:5433/database
```

--------------------------------

### MongoDB Backup Command

Source: https://docs.dokploy.com/docs/core/databases/restore

This command performs a compressed backup of a MongoDB database. It uses mongodump with flags for database name, user, password, archive output, authentication database, and gzip compression.

```shell
mongodump -d '${database}' -u '${databaseUser}' -p '${databasePassword}' --archive --authenticationDatabase=admin --gzip
```

--------------------------------

### Define and Reference Service-Level Variables

Source: https://docs.dokploy.com/docs/core/variables

This snippet demonstrates defining and using service-level environment variables, which are specific to a single service. This is useful for overriding shared variables or setting unique configurations for a service. It also shows the use of the DOKPLOY_DEPLOY_URL variable.

```bash
DATABASE_USER=service_user
DATABASE_PASSWORD=service_password
DATABASE_URL=postgresql://${{DATABASE_USER}}:${{DATABASE_PASSWORD}}@service-database:5432/postgres

APP_URL=https://${{DOKPLOY_DEPLOY_URL}}
```

--------------------------------

### Dokploy API - Trigger Deployment

Source: https://docs.dokploy.com/docs/core/auto-deploy

Programmatically triggers a deployment for a specified application using its ID and an API token.

```APIDOC
## POST /api/application.deploy

### Description
Triggers a deployment for a specific application programmatically. This is useful for integrating with CI/CD pipelines or custom scripts.

### Method
POST

### Endpoint
`/api/application.deploy`

### Parameters
#### Header Parameters
- **x-api-key** (string) - Required - Your Dokploy API token.
- **Content-Type** (string) - Required - Set to `application/json`.

#### Request Body
- **applicationId** (string) - Required - The unique identifier of the application to deploy.

### Request Example
```bash
curl -X 'POST' \
  'https://your-domain/api/application.deploy' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -H 'x-api-key: <token>' \
  -d '{ 
  "applicationId": "string" 
}'
```

### Response
#### Success Response (200)
- **message** (string) - Confirmation message indicating the deployment has been triggered.

#### Response Example
```json
{
  "message": "Deployment triggered successfully."
}
```
```

--------------------------------

### Remove Dokploy Files and Directories

Source: https://docs.dokploy.com/docs/core/uninstall

This command recursively removes the Dokploy configuration directory located at /etc/dokploy. This action will delete all Dokploy-related configuration files and directories from the server.

```shell
sudo rm -rf /etc/dokploy
```

--------------------------------

### Configuring Traefik Labels for Domain Routing in Docker Compose

Source: https://docs.dokploy.com/docs/core/docker-compose/domains

This Docker Compose file illustrates the use of Traefik labels to configure domain routing for frontend and backend services. It enables Traefik, defines host rules for 'frontend.dokploy.com' and 'backend.dokploy.com', and specifies internal ports for each service. Note the use of 'expose' instead of 'ports' for better network isolation.

```yaml
version: "3.8"
 
services:
  frontend:
    build:
      context: ./frontend
      dockerfile: Dockerfile
    volumes:
      - ./frontend:/app
    expose:
      - 3000
    depends_on:
      - backend
    networks:
      - dokploy-network
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.frontend-app.rule=Host(`frontend.dokploy.com`)"
      - "traefik.http.routers.frontend-app.entrypoints=web"
      - "traefik.http.services.frontend-app.loadbalancer.server.port=3000"
 
  backend:
    build:
      context: ./backend
      dockerfile: Dockerfile
    volumes:
      - ./backend:/app
    expose:
      - 5000
    environment:
      - DATABASE_URL=postgres://postgres:password@database:5432/mydatabase
    depends_on:
      - database
    networks:
      - dokploy-network
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.backend-app.rule=Host(`backend.dokploy.com`)"
      - "traefik.http.routers.backend-app.entrypoints=web"
      - "traefik.http.services.backend-app.loadbalancer.server.port=5000"
 
  database:
    # ... (same as before)
 
volumes:
  db-data:
 
networks:
  dokploy-network:
    external: true

```

--------------------------------

### Docker Compose Volume Configuration for Persistence

Source: https://docs.dokploy.com/docs/core/docker-compose

Demonstrates how to configure Docker volumes in a docker-compose.yml file to ensure data persistence across deployments. It highlights the recommended method using relative paths to a shared 'files' folder, contrasting it with an incorrect method that can lead to data loss.

```yaml
volumes:
  - "/folder:/path/in/container" ❌
```

```yaml
volumes:
  - "../files/my-database:/var/lib/mysql" ✅
  - "../files/my-configs:/etc/my-app/config" ✅
```

--------------------------------

### N8N Docker Compose Configuration with SQLite Volume

Source: https://docs.dokploy.com/docs/core/volume-backups

This configuration sets up an N8N service using Docker Compose, specifying a named volume 'n8n_data' for persistent storage of its SQLite database and configuration. This volume is a target for Dokploy's volume backup feature.

```yaml
version: "3.8"
services:
  n8n:
    image: docker.n8n.io/n8nio/n8n:1.83.2
    restart: always
    environment:
      - N8N_HOST=${N8N_HOST}
      - N8N_PORT=${N8N_PORT}
      - N8N_PROTOCOL=http
      - NODE_ENV=production
      - WEBHOOK_URL=https://${N8N_HOST}/
      - GENERIC_TIMEZONE=${GENERIC_TIMEZONE}
      - N8N_SECURE_COOKIE=false
    volumes:
      - n8n_data:/home/node/.n8n

volumes:
  n8n_data:

```

--------------------------------

### Reference Environment-Level Variables in Service

Source: https://docs.dokploy.com/docs/core/variables

This snippet shows how to reference environment-level variables within a service. This allows services to utilize configurations specific to the current environment they are deployed in.

```bash
DATABASE_URL=postgresql://${{environment.DATABASE_PASSWORD}}@staging-db:5432/postgres
EXTERNAL_API_KEY=${{environment.API_KEY}}
```

--------------------------------

### Configure GitHub Container Registry (GHCR) in Dokploy

Source: https://docs.dokploy.com/docs/core/Docker

This snippet demonstrates how to set up Dokploy to pull images from GitHub Container Registry (GHCR). It uses your GitHub username and a personal access token with specific scopes for authentication. The registry URL must be set to 'ghcr.io'.

```plaintext
Docker Image: ghcr.io/username/repository:tag
Docker Registry URL: ghcr.io
Docker Registry Username: YOUR_GITHUB_USERNAME
Docker Registry Password: YOUR_GITHUB_PERSONAL_ACCESS_TOKEN
```

--------------------------------

### List Docker Containers

Source: https://docs.dokploy.com/docs/core/reset-password

This command lists all running Docker containers. It is used to identify the container ID for the Dokploy application.

```bash
docker ps
```

--------------------------------

### Run Docker Command in Container

Source: https://docs.dokploy.com/docs/core/schedule-jobs

This command executes a specified command inside a target Docker container. It requires the container ID and the command to be executed. The target container must be running.

```bash
docker exec -it <container_id> <command>
```

--------------------------------

### Add A Record for External Domain

Source: https://docs.dokploy.com/docs/core/domains/others

This snippet illustrates the steps to add an 'A' record in a DNS panel. It specifies the record type, host name, and the server's IPv4 address. This is a crucial step for pointing your custom domain to your Dokploy-hosted application.

```text
Record Type: A
Host: api
IPv4 Address: 1.2.3.4
```

--------------------------------

### Adding Dokploy Network to Docker Compose Services

Source: https://docs.dokploy.com/docs/core/docker-compose/domains

This Docker Compose configuration snippet demonstrates how to integrate services with the 'dokploy-network'. By adding the 'networks' section to each service and defining 'dokploy-network' as an external network, services can communicate within the Dokploy environment.

```yaml
version: "3.8"
 
services:
  frontend:
    # ... (previous configuration)
    networks:
      - dokploy-network
 
  backend:
    # ... (previous configuration)
    networks:
      - dokploy-network
 
  database:
    # ... (previous configuration)
    networks:
      - dokploy-network
 
volumes:
  db-data:
 
networks:
  dokploy-network:
    external: true

```

--------------------------------

### Reset Dokploy Password via Docker Exec

Source: https://docs.dokploy.com/docs/core/reset-password

This command opens a shell within the specified Dokploy Docker container and executes the 'reset-password' script. This will generate a new random password for your account.

```bash
docker exec -it <container-id> bash -c "pnpm run reset-password"
```

--------------------------------

### Configure Docker Hub Access Token in Dokploy

Source: https://docs.dokploy.com/docs/core/Docker

This snippet shows how to configure Dokploy to use a Docker Hub access token for private registry authentication. It requires your Docker Hub username and the generated personal access token. The registry URL is optional as it defaults to Docker Hub.

```plaintext
Docker Image: nginx:latest
Docker Registry URL: 
Docker Registry Username: YOUR_DOCKERHUB_USERNAME
Docker Registry Password: YOUR_DOCKERHUB_ACCESS_TOKEN
```

--------------------------------

### Reset Dokploy 2FA via Docker Exec

Source: https://docs.dokploy.com/docs/core/reset-password

This command opens a shell within the specified Dokploy Docker container and executes the 'reset-2fa' script. This action will disable Two-Factor Authentication for your account, allowing login without a 2FA code.

```bash
docker exec -it <container-id> bash -c "pnpm run reset-2fa"
```

--------------------------------

### Configure Public Docker Images in Dokploy

Source: https://docs.dokploy.com/docs/core/Docker

This snippet illustrates how to configure Dokploy to pull public Docker images from any registry. For images not hosted on Docker Hub, you need to specify the registry domain. Authentication is not required for public images.

```plaintext
Docker Image: quay.io/prometheus/prometheus:latest
Docker Registry URL: quay.io
Docker Registry Username: 
Docker Registry Password: 
```

--------------------------------

### Remove Dokploy Docker Services

Source: https://docs.dokploy.com/docs/core/uninstall

This command removes the Docker swarm services associated with Dokploy. Ensure Dokploy is not running before executing this command.

```shell
docker service rm dokploy dokploy-traefik dokploy-postgres dokploy-postgres dokploy-redis
```

--------------------------------

### Docker Swarm Update Configuration for Automatic Rollbacks

Source: https://docs.dokploy.com/docs/core/applications/rollbacks

This JSON configuration defines update parameters for a Docker Swarm service, specifically enabling automatic rollbacks on failure. It sets the parallelism (number of tasks to update at once), delay between updates, the action to take on failure ('rollback'), and the order of operations ('start-first'). This configuration ensures that if a deployment fails health checks, Docker Swarm will automatically revert to the previous stable version.

```json
{
  "Parallelism": 1,
  "Delay": 10000000000,
  "FailureAction": "rollback",
  "Order": "start-first"
}
```

--------------------------------

### Remove Dokploy Docker Volumes

Source: https://docs.dokploy.com/docs/core/uninstall

This command forcibly removes the Docker volumes used by Dokploy for persistent data storage, such as the PostgreSQL database and Redis data. This action will result in data loss for these services.

```shell
docker volume rm -f dokploy-postgres-database redis-data-volume
```

--------------------------------

### Remove Dokploy Docker Network

Source: https://docs.dokploy.com/docs/core/uninstall

This command forcibly removes the Docker network created and used by Dokploy for inter-service communication. This network is no longer needed after services are removed.

```shell
docker network rm -f dokploy-network
```

=== COMPLETE CONTENT === This response contains all available snippets from this library. No additional content exists. Do not make further requests.
