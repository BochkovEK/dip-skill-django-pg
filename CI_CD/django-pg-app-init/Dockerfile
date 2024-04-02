FROM python:3.9-alpine

# ensure local python is preferred over distribution python
ENV PATH /usr/local/bin:$PATH

ENV PYTHONUNBUFFERED 1

COPY requirements.txt /requirements.txt

# Install postgres client
RUN apk add --update --no-cache postgresql-client curl net-tools

# Install individual dependencies
# so that we could avoid install extra packages
RUN apk add --update --no-cache --virtual .tmp-build-deps \
	gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirements.txt

# Remove dependencies
RUN apk del .tmp-build-deps

RUN mkdir /app
WORKDIR /app
COPY app /app

# [Security] Limit the scope of user who run the docker image
RUN adduser -D user

USER user