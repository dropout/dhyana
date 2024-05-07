#!/bin/sh

lsof -ti tcp:4000 | xargs kill -9
lsof -ti tcp:8080 | xargs kill -9
lsof -ti tcp:9000 | xargs kill -9

while getopts d: flag
do
    case "${flag}" in
        d) data=${OPTARG};;
    esac
done
echo "Data: support/firebase_emulator/local_data/$data";

(cd support/firebase_emulator && firebase emulators:start --import ./local_data/$data)
