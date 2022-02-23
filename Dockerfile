FROM python:3.9-alpine
MAINTAINER Anfa App Developer Ltd

ENV PYTHONUNBUFFERD 1

COPY ./requirement.txt /requirement.txt
RUN pip install -r requirement.txt


RUN mkdir /app 
WORKDIR /app
COPY ./app /app/

RUN adduser -D user
USER user

