FROM python:3

RUN apt-get update && apt-get install -y cron sudo

#RUN apt-get update && apt-get -y install sudo

RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo

ADD changefields.py /

ADD entrypoint2.sh /

RUN chmod +x entrypoint2.sh

#USER docker
#CMD ["sudo","bash","./entrypoint2.sh",">>","/var/log/lefutott.log"]

#RUN ./entrypoint2.sh

CMD [ "./entrypoint2.sh" ]

#ENTRYPOINT ["./entrypoint2.sh"]

#CMD [ "python", "./changefields.py" ]
