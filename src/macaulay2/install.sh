#!/bin/sh

set -e

MACAULAY2_VERSION=${VERSION:-"latest"}

export DEBIAN_FRONTEND=noninteractive

# Bring in ID, ID_LIKE, VERSION_ID, VERSION_CODENAME
. /etc/os-release

if [ "${ID}" != "debian" && "${ID}" != "ubuntu"]; then
  printf 'Script must be run on Ubuntu or Debian.'
  exit 1
fi

architecture="$(dpkg --print-architecture)"

# Clean up sources
rm -rf /var/lib/apt/lists/*

if [ "$(id -u)" -ne 0 ]; then
  printf 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
  exit 1
fi

# Checks if packages are installed and installs them if not
check_packages() {
  if ! dpkg -s "$@" > /dev/null 2>&1; then
    apt-get update -y
    apt-get -y install --no-install-recommends "$@"
  fi
}

install_from_deb() {
  case "${VERSION_CODENAME}" in
    bookworm)
      printf "deb [arch=${architecture} signed-by=/usr/share/keyrings/debian-keyring.gpg] https://people.debian.org/~dtorrance/debian ${VERSION_CODENAME}/" > /etc/apt/sources.list.d/macaulay2.list
      ;;

    bullseye)
      printf "deb [arch=${architecture} signed-by=/usr/share/keyrings/debian-maintainers.gpg] https://people.debian.org/~dtorrance/debian ${VERSION_CODENAME}/" > /etc/apt/sources.list.d/macaulay2.list
      ;;

    *)
      printf 'Unsupported Debian version. Must be at least Bullsye.'
      exit 1
      ;;
  esac
  apt-get update -y
  printf 'Installing Macaulay2...'
  apt-get -y install --no-install-recommends macaulay2
}

install_from_ppa() {
  add-apt-repository ppa:macaulay2/macaulay2
  apt-get update -y
  printf 'Installing Macaulay2...'
  apt-get -y install --no-install-recommends macaulay2
}

cleanup() {
  # Clean up sources
  printf 'Cleaning up...'
  rm -rf /var/lib/apt/lists/*
}

apt-get update -y
check_packages ca-certificates apt-transport-https
case "${ID}" in
  ubuntu)
    check_packages software-properties-common
    install_from_ppa
    ;;

  debian)
    check_packages debian-keyring
    install_from_deb
    ;;
esac
cleanup

printf 'Done!'
