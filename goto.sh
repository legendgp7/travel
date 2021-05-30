#!/bin/bash

abs_dir="${gptravel_abs}travel/"

typeset -l para
cache_flag=false
find_flag=false

# Dir
config_dir="${abs_dir}config"
source $config_dir

# Default dir for no command line parameters
if [[ $# -eq 0 ]]
then
    para="default"
else
    para=$1
fi


function cache(){
    local tag=`sed -n "1,1p" $cache_dir`
    local address=`sed -n "2,2p" $cache_dir`
    if [[ "$1" == "$tag" ]]
    then
        cd $address
        cache_flag=true
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
            
            cd $mydir
            find_flag=true
            
            echo $1 > cache
            echo $mydir >> cache
            
            break
        fi
    done < $list_dir
    
}


cache $para

if [[ $cache_flag == false ]]
then
    finddir $para
fi

if [[ $cache_flag == false && $find_flag == false ]]
then
    echo "\nNo such path found."
    echo "Please check the command line parameter or add the target path to the list.\n"
fi

unset para cache_flag find_flag
