#!/bin/bash

gunicorn -c gunicorn_config.py sentiment_analysis.sentiment_analysis:app