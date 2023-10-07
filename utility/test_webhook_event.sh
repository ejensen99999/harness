#!/usr/bin/env bash 

file=$1
json=$(cat $file)

readarray -t changes < <(echo $json | jq -c '.commits[] | [.added[], .removed[], .modified[]]' | jq -c '.[]')

declare -A folders

for i in "${changes[@]}"
do
    if [[ "$i" == *.tf* ]]
    then
        dir=$(dirname "${i}" | sed 's/\"//')
        echo $dir
        folders[$dir]=0
    fi
done

result=$(printf ",%s" "${!folders[@]}")
result=${result:1}

echo "[$result]"

export paths="[$result]"