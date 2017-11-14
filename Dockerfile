FROM kennethreitz/pipenv:latest
MAINTAINER Paul Oliver

VOLUME /config

ADD . /fitbit-googlefit

RUN cd /fitbit-googlefit \
    && pipenv install

RUN apt-get -qq update \
    && apt-get -qq -y --no-install-recommends install cron \
    && rm -rf /var/lib/apt/lists/*

ADD crontab /etc/cron.d/fitbit-google-cron

RUN chmod 0644 /etc/cron.d/fitbit-google-cron

CMD ["cron", "-f"]
