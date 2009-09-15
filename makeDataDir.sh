#!/bin/bash
#
# Author: Soo Hwan Park
#

if [ $# -lt 1 ]; then 
  echo "usage: $0 test_id"
  exit 0
fi 

ROOT_DIR=~/AppRepository
test_id=$1
folder=${ROOT_DIR}/$test_id
mkdir -p $folder
#cp ${ROOT_DIR}/makegraph.sh $folder/
for i in `seq 1 3`; do
  mkdir -p $folder/$i
done
exit

#folder=${ROOT_DIR}/`date +%Y%m%d-%H`
#mkdir $folder
databases="hbase hypertable cassandra voldemort mysql"
for database in $databases; do
  mkdir $folder/$database
  cp ${ROOT_DIR}/makegraph.sh $folder/$database
  for i in `seq 1 3`; do
    mkdir -p $folder/$database/$i
  done
done


