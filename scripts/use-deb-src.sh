#!/bin/bash

sudo sed -ir 's/#\s*(deb-src)/\1/g' /etc/apt/sources.list
