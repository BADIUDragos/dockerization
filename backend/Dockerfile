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
# frontend volume install logic, dist build      done
#
# node version                                   done
#
# nginx conf volume in docker-compose            done
#
# map db data to localfolder instead of volume   done
#
# secret key                                     done
#
# volumes for nginx and backend                  done
#
# .env backend ? or docker-compose               done
#
# try removing port 8000 docker-compose backend  done
#
# db ckeck entrypoint connection                 done
#
#
# logs
#   - how do we want these logs, do we want these logs ?
#   - not possible natively directly onto host machine , security risk, is there a need when we can do the following:
#   - for whatever debugging when there is an issue docker logs <container_id> > file_log.txt 2>&1 (stored until container is removed)
#
#   - logging agent, fluentd container living next to it, collecting logs from all the other services and store
#     them itself somewhere on host,
#   - saving involves storage whereas logs on a per need basis doesn't



# e.g. :
#*   myservice:
   #    image: myimage
   #    logging:
   #      driver: fluentd
   #      options:
   #        fluentd-address: localhost:24224
   #        tag: myservice


# Fluentd image
#services:
 #  fluentd:
 #    image: fluent/fluentd:latest
 #    volumes:
 #      - ./fluent.conf:/fluentd/etc/fluent.conf
 #      - /path/to/store/logs:/path/to/store/logs
 #    ports:
 #      - "24224:24224"
 #      - "24224:24224/udp"




# rootless / user per service
#   - rootless running docker itself not root on the machine ?
#   - different from user vs root inside conainer
#   - rootless AND user per service ?
#   - need to install full ubuntu image on my laptop because now I have alpine and I don't

