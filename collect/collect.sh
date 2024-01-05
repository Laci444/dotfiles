#!/bin/sh

script_dir=$(dirname "$(readlink -f "$0")")

for file in $(cat $script_dir/what_to_copy.txt)
do
    cp -r ~/$file $script_dir/..
done
