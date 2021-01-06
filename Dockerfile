FROM python:3

RUN apt-get update && apt-get install -y cron

ADD changefields.py /

ADD entrypoint2.sh /

RUN chmod +x entrypoint2.sh

ENTRYPOINT ["bash","./entrypoint2.sh"]

CMD [ "python", "./changefields.py" ]
