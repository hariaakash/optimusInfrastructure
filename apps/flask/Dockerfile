FROM python:3.7.0-alpine3.8

WORKDIR /app

COPY src .

RUN pip install -r requirements.txt

EXPOSE 8080

CMD ["python", "app.py"]
