FROM python:3.11-slim

ENV PIP_DEFAULT_TIMEOUT=100 \
    PYTHONUNBUFFERED=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_NO_CACHE_DIR=1\
    PYTHONDONTWRITEBYTECODE=1

COPY . /app
WORKDIR /app

RUN pip install -r ./requirements.txt

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
# nginx conf volume in docker-compose
#
# map db data to localfolder instead of volume
#
# secret key
#
# volumes for nginx and backend
#
# .env backend ? or docker-compose
#
# try removing port 8000 docker-compose backend
#
# db ckeck entrypoint connection ?