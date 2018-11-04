FROM python:3.6

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
RUN pip install Flask==0.10.1 uWSGI requests==2.5.1 
WORKDIR /app
COPY app /app
COPY app/test.py  /app/
COPY app/identidock.py  /app/
COPY cmd.sh /

EXPOSE 9090 9191
USER uwsgi

CMD ["/cmd.sh"]
