#!/bin/bash

if [ -x /usr/bin/psql ]; then
      psql -c "CREATE ROLE ${POSTGRES_USER} LOGIN PASSWORD '${POSTGRES_PASSWORD}';" postgres://${POSTGRES_ADMIN_USER}:${POSTGRES_ADMIN_PASSWORD}@${POSTGRES_HOSTNAME}:${POSTGRES_PORT}/postgres

      psql -c "CREATE DATABASE \"${POSTGRES_DATABASE}\"" postgres://${POSTGRES_ADMIN_USER}:${POSTGRES_ADMIN_PASSWORD}@${POSTGRES_HOSTNAME}:${POSTGRES_PORT}/postgres

      psql -c "GRANT ALL PRIVILEGES ON DATABASE "${POSTGRES_DATABASE}" TO ${POSTGRES_USER};" postgres://${POSTGRES_ADMIN_USER}:${POSTGRES_ADMIN_PASSWORD}@${POSTGRES_HOSTNAME}:${POSTGRES_PORT}/postgres
fi