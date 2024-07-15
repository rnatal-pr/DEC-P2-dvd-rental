FROM python:3.9

WORKDIR /app

COPY /app .

RUN pip install -r requirements.txt 

RUN apt-get update && apt-get install -y openssh-client

RUN apt-get update && \
      apt-get -y install sudo

CMD ["/bin/bash"]

ENTRYPOINT ["bash", "orchestrate.sh"]

