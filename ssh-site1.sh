#!/bin/bash
rg="$(cd base-azure-region-1 && terraform output | grep resourceGroup\ = | cut -d\" -f2)-site1"
echo -n "$rg ... "
ip=$(az network public-ip list --resource-group $rg | grep ipAddress | cut -d\" -f4 |head -1)
echo -n "$ip ... "
ssh -o StrictHostKeyChecking=no -i ~/.ves-internal/staging/id_rsa vesop@$ip $@
#ssh centos@$ip
#ssh centos@$ip
