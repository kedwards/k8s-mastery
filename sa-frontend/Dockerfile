FROM node:19-alpine AS base

WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH

COPY src/package*.json ./

RUN npm install

COPY src .


# development
FROM base AS dev

CMD ["npm", "start"]


# build
FROM base AS build

RUN npm run build


# prod
FROM nginx:stable-alpine AS prod

ARG GIT_COMMIT=
ARG BUILD_DATE=
ARG VERSION=

LABEL com.kevinedwards.rtls-web.revision=$GIT_COMMIT
LABEL com.kevinedwards.rtls-web.created=$BUILD_DATE
LABEL com.kevinedwards.rtls-web.version=$VERSION
LABEL com.kevinedwards.rtls-web.vendor="Kevin Edwards"
LABEL com.kevinedwards.rtls-web.authors="Kevin Edwards <kedwards@kevinedwards.com"

COPY --from=build /app/build /usr/share/nginx/html

COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
