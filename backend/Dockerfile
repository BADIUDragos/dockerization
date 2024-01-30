FROM python:3.11-alpine

ENV PIP_DEFAULT_TIMEOUT=100 \
    PYTHONUNBUFFERED=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_NO_CACHE_DIR=1\
    PYTHONDONTWRITEBYTECODE=1

COPY ./requirements.txt .
RUN pip install --no-cache-dir -r ./requirements.txt

RUN apk update && apk add --no-cache netcat-openbsd

COPY . /app
WORKDIR /app

COPY ./entrypoint.sh .
ENTRYPOINT ["sh", "/app/entrypoint.sh"]


# pythonbuffered                                 done
# python cache                                   done
# requirements and static not in root            done
#
# users per service
#
# frontend volume install logic, dist build      done
#
# node version                                   done
#
# nginx conf volume in docker-compose            done
#
# map db data to localfolder instead of volume   done - match path mathing file with .env file ?
#
# secret key
#
# volumes for nginx and backend
#
# .env backend ? or docker-compose
#
# try removing port 8000 docker-compose backend
#
# db ckeck entrypoint connection                 done
#
# logs