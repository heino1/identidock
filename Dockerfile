FROM python:3.6

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
RUN pip install Flask==0.10.1 uWSGI requests==2.5.1 
WORKDIR /app
COPY app /app
ADD  --chown=uwsgi *.py  /app/
COPY identidock.py  /
COPY test.py  /
COPY cmd.sh /

EXPOSE 9090 9191
USER uwsgi

CMD ["/cmd.sh"]
