#!/bin/bash
region=$1
name=$2
echo $region $name
az vm start --resource-group $region --name $name
