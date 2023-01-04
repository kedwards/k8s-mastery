## Install python requirements

```
python -m pip install -r requirements.txt
python -m textblob.download_corpora
```

## Starting the app

` python src/sentiment_analysis/sentiment_analysis.py `

## Building the Docker Container

` docker build -t sentiment-analysis-logic . `

## Running the Docker Container

` docker run -d -p 5000:5000 sentiment-analysis-logic `

### Verifying that it works

Execute a POST on endpoint

```
curl -X POST http://localhost:5000/analyse/sentiment -H "Content-Type: application/json" -d '{"sentence": "I love You"}'
```

## Pushing to Docker Hub

```
export DOCKER_USER_ID=
docker push $DOCKER_USER_ID/sentiment-analysis-logic
```