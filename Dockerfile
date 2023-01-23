FROM python:3.9

WORKDIR /app

COPY . .

EXPOSE 5000

RUN git clone https://github.com/pallets/flask -b 2.2.2

WORKDIR /app/flask/examples/tutorial

RUN python3 -m venv venv

RUN . venv/bin/activate

RUN pip install -e .

ENV FLASK_APP flaskr
ENV FLASK_ENV development

RUN flask init-db

CMD ["flask", "run"]

