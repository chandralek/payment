FROM        python:3
WORKDIR     /app
EXPOSE      7002
COPY        payment.ini /app
COPY        payment.py /app
COPY        rabbitmq.py /app
COPY        requirements.txt /app
RUN         pip install -r requirements.txt
CMD         /usr/local/bin/uwsgi --ini payment.ini
