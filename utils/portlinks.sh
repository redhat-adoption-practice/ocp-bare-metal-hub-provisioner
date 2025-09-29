#!/bin/bash

user=userid

err="[31m"
grn="[32m"
wrn="[33m"
inf="[1m[30m"
zer="[0m"

usage () {
  echo "Check the link status of the network ports of all nodes in a cluster"
  echo
  echo "Usage: $0 <cluster-name> <rack_name> <password>"
  echo
  echo "Example: $0 wh-ocp-hub rack2 password"
  exit
}

query () {
  local url=$1
  
  curl -k -s \
    -u "$user:$pass" \
    -X GET \
    --header 'Content-Type: application/json' \
    --header 'Accept: application/json' \
    $url
}

fail () {
  local msg=$1
  echo "${red}$msg${zer}"
}

if [[ $# -ne 3 ]]
then
  usage
fi

cluster=$1
rack=$2
pass=$3

# check if the rack def exists
hostsfile=hosts_${rack}.txt
if [[ ! -f $hostsfile ]]
then
  fail "Cannot find file $hostsfile"
fi

# check if the cluster is defined
c=`grep -c -e "api\.${cluster}\." "$hostsfile"`
if [[ $c -eq 0 ]]
then
  fail "Cluster $cluster not found."
fi

grep -e "api\.${cluster}\." "$hostsfile" | while read l
do
  SERVER=`echo "$l" | awk '{print $1}'`
  ILO=`echo "$l" | awk '{print $4}'`
  echo "${inf}Network info for ${SERVER} at ILO address ${ILO}${zer}.. "
  curl -k -s \
    -u "$user:$pass" \
    -X GET \
    --header 'Content-Type: application/json' \
    --header 'Accept: application/json' \
    https://${ILO}/redfish/v1/Systems/1/EthernetInterfaces/ \
    | jq '.Members[]."@odata.id"' | sed -e 's/\"//g' \
    | while read i
  do
    url="https://${ILO}${i}"
    echo -n "  ${inf}Interface ${i} Link Status: "
    link=$(query $url | jq .LinkStatus | sed -e 's/\"//g')
    if [[ $link = "null" ]]
    then
      echo "${err}Down${zer}"
    elif [[ $link = "LinkUp" ]]
    then
      echo "${grn}Up${zer}"
    else
      echo "${wrn}Unknown - \"$link\"${zer}"
    fi
  done
  echo
done
