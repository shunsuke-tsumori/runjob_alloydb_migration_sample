FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y wget gnupg && rm -rf /var/lib/apt/lists/*

RUN wget https://storage.googleapis.com/alloydb-auth-proxy/v1.10.2/alloydb-auth-proxy.linux.amd64 -O /usr/local/bin/alloydb_auth_proxy && \
    chmod +x /usr/local/bin/alloydb_auth_proxy

COPY alembic.ini /app/
COPY alembic /app/alembic
COPY pyproject.toml .
COPY requirements.lock .

RUN python -m venv /venv
RUN /venv/bin/pip install --no-cache-dir -r requirements.lock

CMD ./alloydb_auth_proxy projects/[PROJECT_ID]/locations/asia-northeast1/clusters/[CLUSTER_ID]/instances/[INSTANCE_ID] & \
    sleep 10 && \
    /venv/bin/alembic upgrade head
