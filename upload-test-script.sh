#!/bin/bash
for instance in 1a 1b 1c; do
  SCRIPT=test-url-$instance.sh
  WORKLOAD=$(cd base-azure-region-1 && terragrunt output -raw workload${instance}_pip 2>/dev/null)
  echo $WORKLOAD $SCRIPT ...
  scp -o "StrictHostKeyChecking=no" $SCRIPT azureuser@$WORKLOAD:test-url.sh
done
