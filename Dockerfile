# Dockerfile
FROM postgres:14
RUN apt-get update && apt-get install -y postgresql-14-age