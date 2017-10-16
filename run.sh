#!/bin/bash
#
# Author: Georgy Shapchits <gogi.soft.gm@gmail.com>

echo "StrictHostKeyChecking no" > /root/.ssh/config
chmod -R 600 /root/.ssh/*

if [ $1 == "deploy" ]; then
    mpicc ${SRC_FILE} -o a.out
    scp a.out ${USER}@${IP}:~/a.out
    ssh ${USER}@${IP} "update"
elif [ $1 == "run" ]; then
    ssh ${USER}@${IP} "run"
else
    echo "Comands:"
    echo "  - deploy"
    echo "  - run"
fi