FROM python:3

RUN apt-get update && apt-get install -y cron sudo

RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo

ADD changefields.py /

ADD entrypoint2.sh /

RUN chmod +x entrypoint2.sh

RUN chmod 777 /var
RUN chmod 777 /var/run

ENTRYPOINT ["./entrypoint2.sh"]

