# Arkade Project

## First steps

> note 1: this project is configured to run within a Docker container. Make sure to install Docker and Docker-Compose on your machine.

> note 2: the steps here assume your user is within 'docker' group -- if that's not true, please add youself to that group (advised) or run all docker commands with `sudo` (not advised)

To run the development setup, follow these steps:

1. create your own local `.env`: `cp .env.sample .env`
2. edit `.env` to insert your values
3. build the image: `docker-compose build`
4. setup the database: `docker-compose run --rm web rails db:setup`
5. run the development server `docker-compose up`

In order to properly clean the development environment after stopping the server, ensure your containers are down: `docker-compose down`

## Testing

This project adopts `RSpec` and `Cucumber` for its test suits. To dispatch a test suit, please do:

- RSpec: `docker-compose run --rm web rails spec`
- Cucumber: `docker-compose run --rm web rails cucumber`

