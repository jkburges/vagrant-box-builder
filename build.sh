#!/bin/bash

set -x -e

bundle install

BOX_NAME=imos-ubuntu-12.10-server-amd64

bundle exec veewee vbox build ${BOX_NAME} -n
bundle exec veewee vbox validate ${BOX_NAME}

# Should be as simple as `bundle exec veewee vbox export ${BOX_NAME}`,
# but alas: https://github.com/jedi4ever/veewee/issues/601
vagrant package --base ${BOX_NAME} --output ${BOX_NAME}.box
