#!/bin/bash

if [ -z $HOST_UID ] || [ -z $HOST_GID ]; then
  echo 'Run this script before docker runs'
  echo 'eval "echo \"$(cat .id.env.example)\"" > .id.env'
  exit 1
fi

usermod -u $HOST_UID -o tux
groupmod -g $HOST_GID tux

exec /usr/sbin/gosu $USER_NAME "$@"

