FROM python:3.11-slim

RUN pip install --upgrade pip

COPY ./requirements.txt .
RUN pip install -r requirements.txt --no-cache

COPY . /app
WORKDIR /app

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