#!/bin/bash
# check database availablity
db-availability ()
{
  psCount=`ps -ef | grep smon | grep -v 'grep' | grep $ORACLE_SID | wc -l`

  if [ "$psCount" -gt 0 ]
  then
    openMode=`sqlplus -S -L / as sysdba << ENDSQL
    set feedback off
    set hea off pages 0
    set echo off
    set pagesize 500
    set linesize 500
    set long 99999999
    set newpage none
    column open_mode format a50
    select open_mode from v\\$database;
    EXIT;
ENDSQL`

     if [ "$openMode" != "READ WRITE" ]
     then
           echo -e "\nError: Database '$ORACLE_SID' not opened to perform refresh.\n"
           exit 1;
     fi

  else
    echo -e "\nError: Database '$ORACLE_SID' is not running.\n"
        exit 1;

  fi
}
