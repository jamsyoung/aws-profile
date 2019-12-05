#!/bin/bash

set -o errexit   # Exit immediately if a pipeline returns a non-zero status (set -e)

app=aws-profile
version=$(curl -s https://api.github.com/repos/jamsyoung/$app/releases/latest | grep 'tag_name' | cut -d\" -f4)

url=https://github.com/jamsyoung/${app}/releases/download/${version}/ncd_${suffix}
echo "Getting package ${url}"
sudo curl -sSLo "/usr/local/bin/${app}" "${url}"
sudo chmod +x "/usr/local/bin/${app}"

echo "${app} installed to /usr/local/bin"
