FROM node:16
RUN apt-get -y update
RUN apt-get -y install libpng-dev nasm zlib1g-dev

CMD [ "node" ]
