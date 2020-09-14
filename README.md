# Arkade Project

## Badges

[![Maintainability](https://api.codeclimate.com/v1/badges/4e347874f6423c0eb360/maintainability)](https://codeclimate.com/github/Arkade-Team/Arkade/maintainability)

<!--[![Test Coverage](https://api.codeclimate.com/v1/badges/4e347874f6423c0eb360/test_coverage)](https://codeclimate.com/github/Arkade-Team/Arkade/test_coverage)-->

[![Coverage Status](https://coveralls.io/repos/github/Arkade-Team/Arkade/badge.svg?branch=master)](https://coveralls.io/github/Arkade-Team/Arkade?branch=master)

[![Travis Build Status](https://travis-ci.org/Arkade-Team/Arkade.svg?branch=master)](https://travis-ci.org/Arkade-Team/Arkade)

[Heroku](https://protected-mesa-87501.herokuapp.com)

Pivotal Tracker: ?

## Equipe

- Alécio Godoi - github.com/aleciogodoi
- Daniel Quiteque
- Fábio Nogueira - github.com/fabiotk
- Gustavo Molina
- João Daniel - github.com/jooaodanieel
- Pedro França

## Descrição

O **MED CheckApp Dashboard** (nome provisório) é uma plataforma de agregação e visualização de dados médicos. Seu público-alvo são os gestores de saúde, como chefes de hospitais, diretores de clínicas médicas ou gestores de saúde pública. Com este dashboard, o gestor poderá visualizar agregações de dados coletados durante consultas de _check-up_. Tais dados são armazenados pelo fluxo de uso do **MED CheckApp**, um app em atual desenvolvimento numa parceria entre o depto. de Clínica Médica HC-USP e o CodeLab Butantã.

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
