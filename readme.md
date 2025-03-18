# Docker Compose Convenience Script (dcp.sh)

`dcp.sh` is a shell script designed to streamline your Docker Compose workflow by simplifying common commands and offering several convenient features:

- **Quick reload**: Effortlessly update your Dockerized application's configuration with `dcp reload`. This command seamlessly stops and restarts all services, ensuring the latest changes in your docker-compose.yml file are immediately reflected.
- **Alias functionality**: Use `dcp` as a handy alias for docker-compose, saving you time and keystrokes.
- **Default plugin mode**: Enjoy a more streamlined experience with the default plugin mode.
- **Standalone mode support**: If you're using the standalone docker-compose command, simply set the **COMPOSE_CMD** environment variable.

# Installation

## Install as shell function

```sh
git clone https://github.com/vulcanshen/docker-compose-convenience-script.git ~/.dcp
echo "source ~/.dcp/dcp.sh" >> ~/.bashrc
source ~/.dcp/dcp.sh
```

## Install as command

```sh
git clone https://github.com/vulcanshen/docker-compose-convenience-script.git dcp
sudo mv dcp/dcp-cmd /usr/local/bin/dcp
sudo chmod 755 /usr/local/bin/dcp
```

## Quick Install

```sh
sudo curl -sL https://raw.githubusercontent.com/vulcanshen/docker-compose-convenience-script/refs/heads/main/dcp-cmd > /usr/local/bin/dcp
```

# Usage

## As a Docker Compose alias

After installation, you can leverage dcp directly in place of docker-compose. Here are some examples:

```sh
# List all services
dcp ps

# Start all services in detached mode
dcp up -d

# Shutdown all services
dcp down
```

## Standalone Docker Compose mode

If you're using the standalone docker-compose command, set the **COMPOSE_CMD** environment variable before using dcp.sh:

```sh
export COMPOSE_CMD="docker-compose"
```

## Quick reload

The `dcp reload` command simplifies updating your Docker Compose configuration. 
It automates the process of stopping and restarting all services, 
ensuring that any modifications you make to your docker-compose.yml file are promptly reflected 
in your running containers.

**How it works**

1. `dcp reload` gracefully stops all currently running services using docker-compose down.
2. It then initiates `docker-compose up` to restart them based on the latest configuration defined in your docker-compose.yml file.

**Usage examples**

- Basic reload (equivalent to `docker-compose down && docker-compose up`):

    ```sh
    dcp reload
    ```

- Reload in detached mode (equivalent to `docker-compose down && docker-compose up -d`):

    ```sh
    dcp reload -d
    ```

- Reload with a custom YAML file (equivalent to `docker-compose down && docker-compose -f xxx.yaml up`):

    ```sh
    dcp -f xxx.yaml reload
    ```

- Reload with a custom YAML file in detached mode (equivalent to `docker-compose down && docker-compose -f xxx.yaml up -d`):

    ```sh
    dcp -f xxx.yaml reload -d
    ```

# Additional Features

- Supports all Docker Compose commands: dcp.sh seamlessly integrates with all existing docker-compose commands.
- Custom commands: Feel free to add custom Docker Compose commands to the script for further personalization.

# Notes

- Ensure Docker and Docker Compose are correctly installed in your environment.
- If you encounter issues with plugin mode, try switching to standalone mode.
- Carefully review the script content before deploying it to a production environment to ensure security.
