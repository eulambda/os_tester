#!/usr/bin/bash

function tester_impl {
    (sleep 1s; echo "$0"; exit 0;) | make qemu-nox > "../shared-data/$(echo $0)_result.txt"
}
export -f tester_impl
for var in "$@"
do
    timeout 2s bash -c tester_impl $var
done