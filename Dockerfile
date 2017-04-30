FROM ubuntu

RUN apt-get -y update
RUN apt-get -y install wget curl
RUN useradd pmmp
RUN mkdir /home/pmmp
RUN chown -R pmmp:pmmp /home/pmmp/

USER pmmp
WORKDIR /home/pmmp/
RUN curl -sL https://get.pmmp.io | bash -s -

EXPOSE 19132

ENTRYPOINT bash /home/pmmp/start.sh --no-wizard
