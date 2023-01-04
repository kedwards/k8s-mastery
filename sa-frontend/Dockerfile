FROM node:19-alpine AS base

WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH

COPY src/package*.json ./

RUN npm install

COPY src .

# # dev
# FROM base AS dev

# EXPOSE 3000

# CMD ["npm", "start"]

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

ARG WEB_APP_API_URL=http://localhost:8080
ENV WEB_APP_API_URL=${WEB_APP_API_URL}

COPY default.conf.template /etc/nginx/templates/

COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
