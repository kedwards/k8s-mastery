## Installing prerequisites

` npm install --prefix src/ `

## Starting the Web App Locally

` npm start --prefix src/ `

## Building the application

` npm run build --prefix src/ `

## Building the container

` docker build -t sentiment-analysis-frontend . `


```
export WEB_APP_API_URL="http://$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps | grep 'sentiment-analysis-web-app' | awk '{ print $1 }')):8080"
echo $WEB_APP_API_URL
docker build \
  --build-arg WEB_APP_API_URL=$WEB_APP_API_URL \
  -t sentiment-analysis-frontend .
```

## Running the container

` docker run -d -p 80:80 sentiment-analysis-frontend `

#### Native docker support needs the Container IP

To forward messages to the sa-logic container we need to get its IP. To do so execute:

` docker container list `

Copy the id of sa-logic container and execute:

` docker inspect <container_id> `

The Containers IP address is found under the property NetworkSettings.IPAddress, we can find the ip using the following command:

` docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <container_id> `

#### Docker Machine on a VM

Get Docker Machine IP by executing:

` docker-machine ip `

Use this one in the command.

## Pushing the container

```
export $DOCKER_USER_ID=
docker push $DOCKER_USER_ID/sentiment-analysis-frontend
```