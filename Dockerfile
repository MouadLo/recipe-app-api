FROM python:3.9-alpine
LABEL com.anfadevltd.image.authors="mouadls@gmail.com"

ENV PYTHONUNBUFFERD 1

RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
      gcc libc-dev linux-headers postgresql-dev


COPY ./requirement.txt /requirement.txt
RUN pip install -r /requirement.txt

RUN apk del .tmp-build-deps

RUN mkdir /app
WORKDIR /app
COPY ./app /app/

RUN adduser -D user
USER user
