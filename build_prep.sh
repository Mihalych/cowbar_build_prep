#!/usr/bin/env bash

: ${APT_UPDATE:="false"}

pkgs="debootstrap binutils genisoimage ruby1.9.3 kvm rpm rpm2cpio python-pip make git-core"
gems="kwalify json net-http-digest_auth"
pips="pip2pi"

APTGET=$(/usr/bin/env which apt-get)
[ ${APT_UPDATE} == "true" ] && ${APTGET} update
${APTGET} install -y --no-install-recommends ${pkgs}

PIP=$(/usr/bin/env which pip)
if [[ -n ${PIP} ]]; then for p in ${pips}; do
  ${PIP} install ${p}
done; else echo "pip not found!"; exit 1; fi

GEM=$(/usr/bin/env which gem)
if [[ -n ${GEM} ]]; then for g in ${gems}; do
  ${GEM} install ${g}
done; else echo "gem not found!"; exit 1; fi

