FROM node:alpine

RUN mkdir -p /usr/src
WORKDIR /usr/src

COPY frontend /usr/src

RUN npm install -q
RUN npm run build

EXPOSE 3000

CMD cd .next && npm run start