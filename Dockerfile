FROM python:3.6-slim

RUN apt-get clean \
    && apt-get -y update

RUN apt-get -y install \
    nginx \
    python3-dev \
    curl \
    nano \
    build-essential

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt --src /usr/local/src

COPY api.py .

EXPOSE 5000
CMD [ "python", "api.py" ]
