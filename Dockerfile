FROM ubuntu

RUN useradd --user-group --create-home --shell /bin/false app

ENV HOME=/home/app
WORKDIR ${HOME}

RUN apt-get update
RUN apt-get install build-essential pandoc -y

ENV APP_NAME=resume

COPY . ${HOME}/${APP_NAME}/

RUN chown -R app:app ${HOME}/*

USER app
WORKDIR ${HOME}/${APP_NAME}

RUN make clean