#!/bin/sh

install_yarn_package_if_not_exist() {
	if ! yarn global list | grep -q "$1"; then
		echo "Installing yarn package $1"
		yarn global add "$1"
	fi
}

# Install yarn packages
install_yarn_package_if_not_exist lighthouse
