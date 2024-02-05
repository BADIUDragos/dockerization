FROM python:3.11-alpine

ENV PIP_DEFAULT_TIMEOUT=100 \
    PYTHONUNBUFFERED=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_NO_CACHE_DIR=1\
    PYTHONDONTWRITEBYTECODE=1
RUN mkdir -p /app/logs
WORKDIR /app

COPY ./entrypoint.sh .
COPY ./requirements.txt .
RUN pip install --no-cache-dir -r ./requirements.txt

COPY . .

ENTRYPOINT ["sh", "/app/entrypoint.sh"]