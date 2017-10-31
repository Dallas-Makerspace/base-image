#!/usr/bin/env bash

[ -f .env ] && [ -z $AUTOENV ] && source .env

GH_USER=${GH_USER:-`whoami`}
GH_SECRET=${GH_SECRET:-`cat ~/.ghtoken`}
GH_REPO=${GH_REPO:-`basename $(pwd)`}
GH_TARGET=${GH_TARGET:-"master"}
GH_HOST=${GH_HOST:-"api.github.com"}
GH_ENDPOINT="repos/${GH_USER}/${GH_REPO}/releases"

RELEASE_JSON=$(curl -sSLk https://$GH_HOST/${GH_ENDPOINT}/latest)
RELEASE_URL=$(jq -r '.assets[].browser_download_url' <<< ${RELEASE_JSON} )
RELEASE_VERSION=$(jq -r '.name' <<< ${RELEASE_JSON} )

echo "Importing ${GH_REPO} ${RELEASE_VERSION}"
curl -sSLk ${RELEASE_URL} > release
