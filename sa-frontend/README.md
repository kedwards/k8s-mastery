## Starting the Web App Locally
` npm start `

## Building the application
` npm run build `

## Building the container
` docker build -f Dockerfile -t $DOCKER_USER_ID/sentiment-analysis-frontend . `

## Running the container
` docker run -d -p 80:80 $DOCKER_USER_ID/sentiment-analysis-frontend `

## Pushing the container
` docker push $DOCKER_USER_ID/sentiment-analysis-frontend `

`
docker run \
  -itd \
  --rm \
  -v ${PWD}:/app \
  -v /app/node_modules \
  -p 3000:3000 \
  -e CHOKIDAR_USEPOLLING=true \
  sa-frontend:latest

`