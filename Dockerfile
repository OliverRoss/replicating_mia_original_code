FROM python:3.8-buster
RUN /usr/local/bin/python -m pip install --upgrade pip
COPY requirements.txt /replicating_mia/requirements.txt
WORKDIR /replicating_mia
RUN ["pip","install","-r","requirements.txt","--prefer-binary","--no-cache"]

