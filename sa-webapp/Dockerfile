FROM maven:3.6.0-jdk-11-slim AS build

COPY ./src/. ./

RUN mvn install

FROM openjdk:8-jdk-alpine as dev

ARG SA_LOGIC_API_URL=http://localhost:5000
ENV SA_LOGIC_API_URL=$SA_LOGIC_API_URL

COPY --from=build target/sentiment-analysis-web-0.0.1-SNAPSHOT.jar /

EXPOSE 8080

CMD ["java", "-jar", "sentiment-analysis-web-0.0.1-SNAPSHOT.jar", "--sa.logic.api.url=${SA_LOGIC_API_URL}"]
