#!/bin/bash
# extract dmp file
extract-dmp ()
{
  if [ ! -f "$dmpFile" ]
  then
    echo -e "\nError: Unable to locate dmp file '$dmpFile'.\n"
    exit 1;
  else

  fileType=`file $dmpFile | awk '{print $2}' | grep data | wc -l`

    if [ "$fileType" -lt 1 ]
    then
      echo -e "\nError: Dump file '$dmpFile' is not of correct format.\n"
          exit 1;

    else
      cp $dmpFile $impPath
    fi

  fi
}
