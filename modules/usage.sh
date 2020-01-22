#!/bin/bash
# display usage
usage ()
{
  echo -e "\n================================================================================\n"
  echo -e "$script v$version"
  echo -e "\n  Usage: $0 <ORACLE SID>  <DUMPFILE>"
  echo -e "\n  Example: $0 testdb /backup/datapump/testdb.dmp"
  echo -e "\n================================================================================\n"
}
