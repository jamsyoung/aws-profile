#!/bin/bash

# throw this in your .bash_profile or something
aws-profile() {
  case "${1}" in
    list)
      grep "^\\[" "${HOME}/.aws/credentials" | sort
      ;;
    set)
      export AWS_PROFILE="${2}"
      ;;
    whoami)
      profilevars=(
        AWS_ACCESS_KEY_ID   AWS_CA_BUNDLE           AWS_CONFIG_FILE     AWS_DEFAULT_OUTPUT            AWS_DEFAULT_REGION
        AWS_PROFILE         AWS_SECRET_ACCESS_KEY   AWS_SESSION_TOKEN   AWS_SHARED_CREDENTIALS_FILE
      )
      for vars in "${profilevars[@]}"; do printf "%30s|%s\\n" " ${vars} " " ${!vars}"; done
      ;;
    *)
      echo "Usage: ${0} {list|set|whoami}"
  esac
}
