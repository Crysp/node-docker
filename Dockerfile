FROM node:lts-buster-slim

RUN mkdir /home/node/app/ && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY --chown=node:node package-lock.json package.json ./

USER node

RUN npm install

CMD npm start
