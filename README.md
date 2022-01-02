# Dev Environment

A linux development environment, running in docker.

## Running

1. Build and start the containers.

        docker-compose up

2. Navigate to the Guacamole web UI at `http://localhost:8080/guacamole`.

3. Log in with username `guacadmin` and password `guacadmin`.

4. Log in via SSH with username `developer` and password `developer`.

5. Start the VNC Server with `vncserver` at the command line.

6. Log in via VNC using Guacamole with password `developer`.

## Maintainer

Aidan Nagorcka-Smith (aidanns@gmail.com)

