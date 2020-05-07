#!/bin/sh

for project in $(gcloud projects list --format="value(projectId)")
do
    echo "- $project"
    gcloud compute instances list -q --project $project --filter="name~'$1'" --format="csv[no-heading](name,zone,networkInterfaces.networkIP,status)" | sed "s/$/,$project/" >> $1.csv
done
