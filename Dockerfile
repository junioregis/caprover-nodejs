FROM node:14-alpine

ARG APP_PATH="/app"

WORKDIR ${APP_PATH}

COPY ./app/package*.json ./

RUN npm install --production

COPY ./app/ ${APP_PATH}

EXPOSE 3000

CMD npm run prd