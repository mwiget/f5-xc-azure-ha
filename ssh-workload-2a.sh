#!/bin/bash
WORKLOAD=$(cd base-azure-region-2 && terragrunt output -raw workload2a_pip 2>/dev/null)
echo ssh azureuser@$WORKLOAD ...
ssh -o "StrictHostKeyChecking=no" azureuser@$WORKLOAD $@
