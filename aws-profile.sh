#!/bin/bash

set -o errexit   # Exit immediately if a pipeline returns a non-zero status (set -e)
echo $0
case "${1}" in
  list)
    grep "^\\[" "${HOME}/.aws/credentials" | sort
    ;;
  set)
    if [ -z "${2}" ]; then
      echo "Usage: aws-profile set value"
    else
      export AWS_PROFILE="${2}"
      echo "AWS_PROFILE set to ${2}"
    fi
    ;;
  info)
    profilevars=(
      AWS_ACCESS_KEY_ID   AWS_CA_BUNDLE           AWS_CONFIG_FILE     AWS_DEFAULT_OUTPUT            AWS_DEFAULT_REGION
      AWS_PROFILE         AWS_SECRET_ACCESS_KEY   AWS_SESSION_TOKEN   AWS_SHARED_CREDENTIALS_FILE
    )
    for vars in "${profilevars[@]}"; do printf "%30s|%s\\n" " ${vars} " " ${!vars}"; done
    ;;
  version)
    echo "aws-profile v1.0.0"
    ;;
  *)
    echo "Usage: . aws-profile {info|list|set|version}"
esac
