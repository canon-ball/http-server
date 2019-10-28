FROM python:3.7-stretch

MAINTAINER Anton Belkin

COPY . /app

WORKDIR /app

RUN pip install -r requirements.txt

ENTRYPOINT [ "python" ]

CMD ["avito.py"]
