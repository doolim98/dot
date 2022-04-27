#!/bin/sh

SSHFS_OPTS="-o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3"

sshfs $SSHFS_OPTS "$@"
