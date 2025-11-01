FROM python:3.14-alpine

ENV PYTHONUNBUFFERED=1

WORKDIR /backend

RUN apk add --no-cache cron

COPY . .

COPY app/crontab.txt /etc/crontabs/root

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]
