####################################
########### VARIABLES ##############
####################################
GCP_PROJECT="codigo-projeto-gcp"
SERVICE_NAME="nome-meu-projeto"
REGION="us-central1"

####################################
###### GENERATED VARIABLES #########
####################################
IMAGE_NAME="gcr.io/$GCP_PROJECT/$SERVICE_NAME"
IMAGE_NAME_LATEST="$IMAGE_NAME:latest"

####################################
########## CLEANUP GCR #############
####################################
gcloud container images delete "$IMAGE_NAME_LATEST" \
   --force-delete-tags \
   --quiet

####################################
####### CLEANUP Cloud RUn ##########
####################################
gcloud run services delete $SERVICE_NAME \
  --project $GCP_PROJECT \
  --platform managed \
  --region $REGION
