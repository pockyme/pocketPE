FROM php:7
RUN useradd pmmp
RUN mkdir /home/pmmp/
USER pmmp
WORKDIR /home/pmmp/
RUN curl -sL https://get.pmmp.io | bash -s -
RUN chown -R pmmp:pmmp /home/pmmp/
EXPOSE 19132
ENTRYPOINT bash /home/pmmp/start.sh --no-wizard
