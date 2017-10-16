#!/bin/bash

set -ex

if [ -n "$BOSH_CA_CERT" ]; then
  echo "$BOSH_CA_CERT" > /tmp/ca.cert
fi

bosh -e ${BOSH_DIRECTOR_IP} --ca-cert /tmp/ca.cert login <<EOF 1>/dev/null
${BOSH_DIRECTOR_USERNAME}
${BOSH_DIRECTOR_PASSWORD}
EOF

bosh -e ${BOSH_DIRECTOR_IP} --ca-cert /tmp/ca.cert -d ${DEPLOYMENT_NAME} run-errand ${ERRAND_NAME}
