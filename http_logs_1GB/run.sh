#!/bin/bash
ELASTICSEARCH_HOST=${ELASTICSEARCH_HOST:-"http://localhost:9200"}
ELASTICSEARCH_USERNAME=${ELASTICSEARCH_USERNAME:-"elastic"}
ELASTICSEARCH_PASSWORD=${ELASTICSEARCH_PASSWORD:-"changeme"}

esrally race \
  --target-hosts "${ELASTICSEARCH_HOST}" \
  --client-options "basic_auth_user:'${ELASTICSEARCH_USERNAME}',basic_auth_password:'${ELASTICSEARCH_PASSWORD}'" \
  --pipeline benchmark-only  \
  --report-file ${PWD}/rally-report.md \
  --report-format markdown \
  --kill-running-processes \
  --include-tasks="index-append" \
  --track-path=${PWD}
