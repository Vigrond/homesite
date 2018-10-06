#!/bin/bash
#  Docker start script, called by docker-compose

# Check if database is ready

until PGPASSWORD=$POSTGRES_PASSWORD psql -h "$POSTGRES_HOST" -U "$POSTGRES_USER" $POSTGRES_DB -c "\q"; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done
echo "Postgres is ready.  Starting nginx..."

# ensure migrations
python /code/backend/manage.py migrate

# Start our web server
nginx
gunicorn --pythonpath=/code/backend/ --bind=0.0.0.0:8000 --pid /tmp/gunicorn.pid --log-config /code/docker/backend/logging.conf backend.wsgi
