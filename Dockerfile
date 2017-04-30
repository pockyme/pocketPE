FROM ubuntu

RUN apt-get -y update
RUN apt-get -y install wget curl
RUN useradd pmmp
RUN mkdir /home/pmmp

RUN wget -O installer.sh https://raw.githubusercontent.com/pmmp/php-build-scripts/master/installer.sh -P /home/pmmp/

RUN chown -R pmmp:pmmp /home/pmmp/

USER pmmp
WORKDIR /home/pmmp/

RUN chmod +x /home/pmmp/installer.sh

RUN bash /home/pmmp/installer.sh

EXPOSE 19132

ENTRYPOINT bash /home/pmmp/start.sh --no-wizard
