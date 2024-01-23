FROM python:3.11-slim

ENV PIP_DEFAULT_TIMEOUT=100 \
    PYTHONUNBUFFERED=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_NO_CACHE_DIR=1\
    POETRY_VERSION=1.3.2

COPY . /app
WORKDIR /app

RUN pip install -r ./requirements.txt

COPY ./entrypoint.sh .
ENTRYPOINT ["sh", "/app/entrypoint.sh"]


#pythonbuffered
#python cache
#requirements and static not in root
#
#users per service
#
#frontend volume install logic, dist build
#
#node version
#
#nginx conf volume in docker-compose
#
#map db data to localfolder instead of volume
#
# ecret key
#
# volumes for nginx and backend
#
# .env backend ? or docker-compose
#
# try removing port 8000 docker-compose backend
#
# db ckeck entrypoint connection ?