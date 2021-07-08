#!/bin/bash
gcloud config configurations activate nome_docker
gcloud builds submit --tag gcr.io/nome_projeto/nome_docker
gcloud run deploy nome_docker \
--image gcr.io/nome_projeto/nome_docker \
--memory 1Gi \
--port 80 \
--platform managed \
--region us-central1 \
--allow-unauthenticated