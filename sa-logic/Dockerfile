FROM python:3.6-slim as dev

ENV PYTHONDONTWRITEBYTECODE=0
ENV PYTHONUNBUFFERED=1
ENV PIP_DISABLE_PIP_VERSION_CHECK=1

COPY src/requirements.txt .

RUN pip3 install -r requirements.txt && \
    python3 -m textblob.download_corpora

WORKDIR /app

COPY src/ .

EXPOSE 5000

ENTRYPOINT ["gunicorn", "-c", "gunicorn_config.py", "sentiment_analysis.sentiment_analysis:app"]
