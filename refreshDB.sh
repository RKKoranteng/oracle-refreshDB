#!/bin/bash
# Copyright (c) 2020 Richard Koranteng
# 
# URL: RKKoranteng.com
#
# AUTHOR: Richard Koranteng
#
# NAME: refreshDB.sh
#
# USAGE: ./refreshDb.sh <ORACLE_SID> <DUMPFILE>
#
# DESCCRIPTION: database refresh operations
#
# CHANGE:
# 11/22/2019    initial development (version 1.2.1)
# 01/15/2020    (version 2.0.1)
#
# SUMMARY OF STEPS:
# 1. check database availability
# 2. extract export dump file
# 3. execute refresh/import

# declare variables
script='Refresh Database'
version='2.1'
ORACLE_SID=$1
compName=$ORACLE_SID
dmpFile=$2
scriptRoot=$(pwd)
envConfig=config.sh
componentDir=$scriptRoot/components
inventoryDir=$scriptRoot/inventory
logDir=$scriptRoot/logs
moduleDir=$scriptRoot/modules
today=`date +%m%d%y`

# call all user variables from config file
if [ -f "$inventoryDir/$envConfig" ]
then
  . $inventoryDir/$envConfig
else
  clear
  echo -e "\nError: Invalid/missing environment config file '$inventoryDir/$envConfig'"
  usage
  exit 1;
fi

# call all module functions
for i in `ls  ${moduleDir}/*.sh`
do
  module=$i
  . $module
done

# check syntax
if [ $# -ne 2 ] || [ $1 == "usage" ]
then
  clear
  usage
  exit 1;

else

  #main
  db-availability
  extract-dmp
  run-component

fi
