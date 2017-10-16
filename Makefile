#!/bin/bash
#
# Author: Georgy Shapchits <gogi.soft.gm@gmail.com>

AUTH=goginet
NAME=gluster_client
TAG=${AUTH}/${NAME}

all: build push

build:
	docker build -t $(TAG) .

push:
	docker push $(TAG)
