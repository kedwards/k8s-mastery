## Required Prerequisites

### Debian/ubuntu 

` sudo apt-get install openjdk-8-jdk `

## Check versions

` update-java-alternatives --list `

## Set Required jdk version

` sudo update-java-alternatives --set /usr/lib/jvm/java-1.8.0-openjdk-amd64 `

### Arch
` sudo pacman -S jdk8-openjdk `

## Packaging the application

` mvn install -f src/ `

## Running the application

```
java -jar \
  src/target/sentiment-analysis-web-0.0.1-SNAPSHOT.jar \
  --sa.logic.api.url=http://localhost:5000
```

## Check Health

` curl -X GET http://localhost:8080/testHealth `

## Building the container

` docker build -t ${DOCKER_USER_ID}/sentiment-analysis-web-app:v1.0.0 . `

## Running the container

###  Container IP

the webapp is required to forward messages to the sa-logic container, for this we need to get the IP of the sa-logic container. To do so execute:

` docker container list `

Copy the id of sa-logic container and execute:

` docker inspect <container_id> `

The Containers IP address is found under the property NetworkSettings.IPAddress, we can find the ip using the following command:

` docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <container_id> `


```
export SA_LOGIC_API_URL="http://$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps | grep 'sentiment-analysis-logic' | awk '{ print $1 }')):5000"
echo $SA_LOGIC_API_URL
docker run -d \
  -p 8080:8080 \
  -e SA_LOGIC_API_URL=$SA_LOGIC_API_URL \
  sentiment-analysis-web-app
```

## Pushing the container

```
export DOCKER_USER_ID=
docker push $DOCKER_USER_ID/sentiment-analysis-web-app
```
