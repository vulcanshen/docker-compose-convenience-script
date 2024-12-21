# Docker Compose Convenience Script (dcp.sh)

dcp.sh is a shell script designed to simplify common Docker Compose commands, providing a more efficient way to manage your Dockerized applications. This script offers several convenient features, including:

- Alias functionality: Sets dcp as an alias for docker-compose for quick and easy use.
- Default plugin mode: Uses Docker Compose plugin mode by default for a more streamlined experience.
- Standalone mode support: If you're using the standalone docker-compose command, simply set the COMPOSE_CMD environment variable.
- Quick reload: Use the `dcp reload` command to quickly stop and restart all services.


# Installation

```sh
curl -fsSL https://raw.githubusercontent.com/vulcanshen/docker-compose-convenience-script/refs/heads/main/dcp.sh -o dcp.sh
source dcp.sh
```

# Usage

## As a Docker Compose alias

After installation, you can use dcp directly in place of docker-compose. For example:

```sh
# List all services
dcp ps

# Start all services in detached mode
dcp up -d

# Shutdown all service
dcp down
```

## Standalone Docker Compose mode

If you're using the standalone docker-compose command, set the COMPOSE_CMD environment variable before using dcp.sh:

```sh
export COMPOSE_CMD="docker-compose"
```

## Quick reload

`dcp reload` is a convenient command that helps you quickly update your Docker Compose configuration without having to manually stop and start services.

The `dcp reload` command provides a quick way to stop and restart all services. It first executes the `down` command to stop all running services, then runs the `up -d` command to restart them. This sequence ensures that any updates made to your YAML configuration file will take effect immediately. In other words, if you modify your Docker Compose YAML file and then run `dcp reload`, the containers will be recreated based on the new configuration, allowing your application to reflect the latest changes.

```sh
# execute `down` then `up -d`
dcp reload
```


# Additional Features

- Other Docker Compose commands: dcp.sh supports all docker-compose commands.
- Custom commands: You can add custom Docker Compose commands to the script.

# Notes
- Environment variables: Ensure that Docker and Docker Compose are installed correctly in your environment.
- Plugin mode: If you encounter any issues, try switching to standalone mode.
- Security: Carefully review the script content before deploying it to a production environment to ensure its security.