# Apache AGE Docker Setup

This repository provides a Docker-based setup for Apache AGE, a PostgreSQL extension that provides graph database functionality.
This setup uses a Master-Slave structure. In this structure, the master server is responsible for handling writes, while the slave servers replicate the master server and handle read queries. 

## Requirements

- Docker
- Docker-compose

## Components

This setup includes the following components:

- [Postgres 14 (Official Image)](https://github.com/docker-library/postgres/tree/c86568af4a6861cb30b8f1b736b0868a3129bdd6)
- [Apache Age](https://github.com/apache/age)

## Getting Started

1. Ensure that you have Docker and Docker-compose installed on your machine.
2. Clone this repository.
3. Run `docker-compose up` in the root directory of the repository.

## More Information

For more information about Apache AGE, visit the [official GitHub repository](https://github.com/apache/age).