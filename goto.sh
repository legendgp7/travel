#!/bin/bash

typeset -l para
para=$1

cache_flag=true

function cache(){
    local tag=`sed -n "1,1p" cache`
    local address=`sed -n "2,2p" cache`
    echo $tag $1
    if [[ "$1" == "$tag" ]]
    then
        cd $address
        cache_flag=false
    fi
}

function finddir(){

    local length=${#1}
    typeset -l address
    while read address
    
    do
        if [[ ${#address} -gt $length && ${address:${length}:1} == " " && ${address:0:${length}} == $1 ]]
        then
            local st=`expr ${length} + 1`
            local num=`expr ${#address} - $length - 1`
            local mydir=${address:${st}:${num}}
            echo $1 > cache
            echo $mydir >> cache
            break
        fi
    done < config

    cd $mydir
}

cache $para

if $cache_flag
then
    finddir $para
fi

unset para cache_flag
