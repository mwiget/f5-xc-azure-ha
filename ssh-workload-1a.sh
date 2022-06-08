#!/bin/bash
WORKLOAD=$(cd base-azure-region-1 && terragrunt output -raw workload1a_pip 2>/dev/null)
echo ssh azureuser@$WORKLOAD ...
ssh -o "StrictHostKeyChecking=no" azureuser@$WORKLOAD $@
