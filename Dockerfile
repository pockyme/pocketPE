FROM php:7

RUN useradd pmmp
RUN mkdir /home/pmmp/
COPY installer.sh /home/pmmp/
RUN chown -R pmmp:pmmp /home/pmmp/

USER pmmp
WORKDIR /home/pmmp/
RUN wget https://raw.githubusercontent.com/pmmp/php-build-scripts/master/installer.sh
RUN chmod 0775 installer.sh
RUN ./installer.sh

EXPOSE 19132

ENTRYPOINT bash /home/pmmp/start.sh --no-wizard
