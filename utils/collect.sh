#!/bin/sh

script_dir=$(dirname "$(readlink -f "$0")")

for file in $(cat $script_dir/files.txt)
do
    cp -r ~/$file $script_dir/..
done
