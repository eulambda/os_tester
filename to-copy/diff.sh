#!/usr/bin/bash

git init
git config user.email "email@email.email"
git config user.name "name"
tar -xvf xv6_submission_original.tar
git add .
git commit -m"base"
tar -xvf xv6_submission.tar
cksum xv6_submission_original.tar > shared-data/cksum-xv6_submission_original.tar.txt
cksum xv6_submission.tar > shared-data/cksum-xv6_submission.tar.txt
git diff > shared-data/diff.txt