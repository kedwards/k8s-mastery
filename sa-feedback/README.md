## The SA-Feedback service

Stores users feedback if the Sentiment Analysis was correct or not in a SQLite database. In a real app it would be used to train the Sentiment Analysis model, in our case we use it as an opportunity to showcase **Kubernetes Volumes**.

#### Setting up the service

**Prerequisite:** install `dotnet core 2.1`

```
wget https://packages.microsoft.com/config/ubuntu/22.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
```

Install SDK

```
sudo apt-get update && sudo apt-get install -y dotnet-sdk-7.0
```

### Running the application

To run the app execute the command below (from the directory of sa-feedback)

` dotnet run `

## Building the Docker Container

```
$ docker build -t $DOCKER_USER_ID/sentiment-analysis-feedback .
```

## Creating the database

If you want to make changes to the model, you need to create a new migration and re-start the application.
To create a new migration execute:

```
$ dotnet ef migrations add $MIGRATION_NAME
```

## Building the Docker Container

` docker build -t sentiment-analysis-feedback . `

## Running the Docker Container

```
docker run -it \
  --name feedback \
  -p 5000:80 \
  -v $(pwd)/Database:/usr/database \
  -e DATABASE_DIR=/usr/database \
  sentiment-analysis-feedback
```
