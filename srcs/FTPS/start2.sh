#!/bin/sh
#/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf

# Point to the internal API server hostname
APISERVER=https://kubernetes.default.svc

# Path to ServiceAccount token
SERVICEACCOUNT=/var/run/secrets/kubernetes.io/serviceaccount

# Read this Pod's namespace
NAMESPACE=$(cat ${SERVICEACCOUNT}/namespace)

# Read the ServiceAccount bearer token
TOKEN=$(cat ${SERVICEACCOUNT}/token)

# Reference the internal certificate authority (CA)
CACERT=${SERVICEACCOUNT}/ca.crt

SERVICE=$(echo $HOSTNAME | cut -d- -f1)



# Explore the API with TOKEN
export ADDR=$(curl --cacert ${CACERT} --header "Authorization: Bearer ${TOKEN}" -X GET ${APISERVER}/api/v1/namespaces/$NAMESPACE/services/$SERVICE/ 2>/dev/null| jq -r '.status | .loadBalancer | .ingress | .[] | .ip')

echo FTP-SERVER : $ADDR

sed -i "s/pasv_address=ADDR/pasv_address=$ADDR/g" /etc/vsftpd/vsftpd.conf

#exit $?
