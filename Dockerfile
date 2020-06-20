FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install awscli python3 python3-pip -y && \
    pip3 install boto3

