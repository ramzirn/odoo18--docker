FROM python:3.12-slim

WORKDIR /opt/odoo

RUN apt-get update && apt-get install -y \
    libpq-dev \
    libldap2-dev \
    libsasl2-dev \
    gcc \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8069

CMD ["python3", "odoo-bin"]
