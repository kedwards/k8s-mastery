FROM python:3.6-slim as dev

WORKDIR /app

COPY ./src ./

RUN pip3 install -r requirements.txt && \
    python3 -m textblob.download_corpora

EXPOSE 5000

ENTRYPOINT ["python3"]

CMD ["/app/sentiment_analysis.py"]
