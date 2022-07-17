#!/bin/bash
az vm list --resource-group mwha-region-1-site1 | jq ".[] | {location: .location, name: .name}"
az vm list --resource-group mwha-region-2-site2 | jq ".[] | {location: .location, name: .name}"

