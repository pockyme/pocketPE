FROM ubuntu
RUN apt-get -y update
RUN apt-get -y install wget curl
RUN useradd pmmp
RUN mkdir /home/pmmp/
RUN chown -R pmmp:pmmp /home/pmmp/

USER pmmp
WORKDIR /home/pmmp/
RUN wget https://raw.githubusercontent.com/pmmp/php-build-scripts/master/installer.sh
RUN chmod +x installer.sh

RUN bash installer.sh
RUN bash -u -f installer.sh
EXPOSE 19132

ENTRYPOINT bash /home/pmmp/start.sh --no-wizard
