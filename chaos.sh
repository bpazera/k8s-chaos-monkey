#!/bin/bash
# Randomly delete pods in a Kubernetes namespace.
set -e

: ${DELAY:=30}
: ${NAMESPACE:=empty}
: ${CHAOS_MONKEY_EXCLUDES:=chaos-monkey}

echo "Getting API Token from /var/run/secrets/kubernetes.io/serviceaccount/token"
TOKEN=`cat /var/run/secrets/kubernetes.io/serviceaccount/token`

while true; do
  echo "Selecting pod to kill, from namespace: ${NAMESPACE}"
  POD_TO_KILL=`curl  -sSk -H "Authorization: Bearer $TOKEN" https://$KUBERNETES_PORT_443_TCP_ADDR:$KUBERNETES_SERVICE_PORT/api/v1/namespaces/${NAMESPACE}/pods | python parse_json.py`
  echo "Selected pod $POD_TO_KILL, killing..."
  curl  -I -sSk -H "Authorization: Bearer $TOKEN" https://$KUBERNETES_PORT_443_TCP_ADDR:$KUBERNETES_SERVICE_PORT/api/v1/namespaces/${NAMESPACE}/pods/$POD_TO_KILL -XDELETE

  echo "Pod Killed, Going to sleep for ${DELAY} s"
  sleep "${DELAY}"
done
