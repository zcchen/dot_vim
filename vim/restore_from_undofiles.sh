#!/usr/bin/env bash

usage="$0 <restore-path> <undo-files>"

input_restore_path=$1
shift
input_undo_files=$@

undo_files=$(ls -1 ${input_undo_files})
mkdir -p ${input_restore_path}

for f in ${undo_files[@]}; do
    basename_f=$(basename $f)
    prev_filename=$(echo ${basename_f} | sed -e "s:%:/:g")
    echo "prev filename: <${prev_filename}>"

    prev_dirs=$(dirname ${prev_filename})

    echo "making tmp folder <${input_restore_path}/${prev_dirs}>"
    mkdir -p ${input_restore_path}/${prev_dirs}

    strings $f > ${input_restore_path}/${prev_filename}
done
