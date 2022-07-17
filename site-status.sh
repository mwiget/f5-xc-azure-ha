#!/bin/bash
#
# Check that site is online before creating workload resources
#
for site in mwha-azure-1 mwha-azure-2; do
  site_state=$(curl --location --request GET $VOLT_API_URL/config/namespaces/system/azure_vnet_sites/$site  -H "Authorization: APIToken $VOLTERRA_TOKEN" -H "content-type: application/json" -s  |jq -r .spec.site_state)
  echo $site $site_state
done
date
