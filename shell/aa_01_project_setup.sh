#!/bin/bash
####required chmod +x aa_01_project_setup.sh
# Generate a random project ID for each run (replace with a fixed ID if desired)
#PROJECT_ID="p-grandata-`date +%y%m%d-%H%M%S`"
PROJECT_ID=$(awk '{ print $1;exit }' ~/grandata/PROJECT_ID)
REGION="us-east4"
ZONE="us-east4-c"
SERVICE_ACCOUNT_NAME="sa-grandata"
CLUSTER_NAME="grandataspark"

echo "PROJECT_ID: $PROJECT_ID"
echo "REGION: $REGION"
echo "ZONE: $ZONE"

echo $PROJECT_ID > ~/grandata/PROJECT_ID

####### create the environment source file with variables
awk '{print "export PROJECT_ID=" $0, "\n" "export BUCKET=" $0, "\n"  }' ~/grandata/PROJECT_ID > ~/grandata/env.txt
echo "export REGION=$REGION" >> ~/grandata/env.txt
echo "export ZONE=$ZONE" >> ~/grandata/env.txt
echo "export SERVICE_ACCOUNT_NAME=$SERVICE_ACCOUNT_NAME" >> ~/grandata/env.txt
echo "export CLUSTER_NAME=$CLUSTER_NAME" >> ~/grandata/env.txt

echo "echo '#########TEST SOURCE'" >> ~/grandata/env.txt
echo "echo 'PROJECT_ID: $PROJECT_ID'" >> ~/grandata/env.txt
echo "echo 'REGION: $REGION'" >> ~/grandata/env.txt
echo "echo 'ZONE: $ZONE'" >> ~/grandata/env.txt
echo "echo 'SERVICE_ACCOUNT_NAME: $SERVICE_ACCOUNT_NAME'" >> ~/grandata/env.txt
echo "echo 'CLUSTER_NAME: $CLUSTER_NAME'" >> ~/grandata/env.txt

source ~/grandata/env.txt
echo $PROJECT_ID

###### Create project
#gcloud projects create "$PROJECT_ID"

