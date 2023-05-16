# https://nodejs.org/ja/docs/guides/nodejs-docker-webapp
FROM node:20

WORKDIR /usr/src/app

COPY package*.json ./

RUN yarn install --frozen-lockfile

COPY . .

CMD [ "node", "index.js" ]