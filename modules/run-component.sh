#!/bin/bash
# identify component
run-component ()
{
  launchScript=`grep -w ${compName} $inventoryDir/comp-list.sh | awk '{print $2}'`

  if [ -z "$launchScript" ]
  then
    launchScript='comp-generic.sh'
        compName=generic
  fi

  . $componentDir/$launchScript
}
