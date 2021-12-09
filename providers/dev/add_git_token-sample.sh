#!/bin/bash
echo 'Set git token to ENV'
export TF_VAR_git_token=""
env | grep 'TF_VAR_git_token'
