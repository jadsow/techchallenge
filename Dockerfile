FROM node:18-alpine

WORKDIR /usr/src/app

COPY package.json package-lock.json ./
RUN npm install

COPY . .

RUN npm i -g npm

ARG MONGO_URI
ENV MONGO_URI=$MONGO_URI
ENV PORT=3010

RUN npm run build

EXPOSE 3010

CMD ["npm", "run", "start:dev"]
