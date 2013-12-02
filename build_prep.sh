#!/usr/bin/env bash

pkgs="debootstrap binutils genisoimage ruby kvm rpm rpm2cpio python-pip make git-core"
gems="kwalify json net-http-digest_auth"
pips="pip2pi"

APTGET=$(/usr/bin/env which apt-get)
${APTGET} install ${pkgs}

PIP=$(/usr/bin/env which pip)
${PIP} install ${pips}

GEM=$(/usr/bin/env which gem)
${GEM} install ${gems}

