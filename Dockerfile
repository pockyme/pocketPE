FROM php:7

RUN useradd pmmp
RUN mkdir /home/pmmp/
COPY installer.sh /home/pmmp/
RUN chown -R pmmp:pmmp /home/pmmp/

USER pmmp
WORKDIR /home/pmmp/

RUN chmod 755 installer.sh

RUN bash installer.sh
RUN bash -u installer.sh
EXPOSE 19132

ENTRYPOINT bash /home/pmmp/start.sh --no-wizard
