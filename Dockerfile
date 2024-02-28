# syntax=docker/dockerfile:1
FROM python:3.8-slim-buster

WORKDIR /projetobase

COPY app.py .
COPY requirements.txt .
COPY templates templates
COPY static static

RUN pip install -r requirements.txt

EXPOSE 5000

CMD ["python3", "app.py"]
