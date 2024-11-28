FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  npm i pm2 -g && \
  rm -rf /var/lib/apt/lists/*
  
RUN git clone https://github.com/SupremusJohn/Mirage-MD  /root/MIRAGE_MD V1.5.2
WORKDIR /root/MIRAGE_MD V1.5.2/


COPY package.json .
RUN npm install pm2 -g
RUN npm install --legacy-peer-deps

COPY . .

EXPOSE 10000

CMD ["node", "index.js"]
