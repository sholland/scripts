#!/bin/bash

types='vpc-standard vrealm-multitenant-dr2c praxis-core praxis-node-mgmt'

for type in $types
do
  extras=''
  if [ $type = 'praxis-core' ]; then
    extras='--vcd-version 6.4 --vcd-cell-count 4 --count-dr20-vrcs 3 --count-dr20-cproxy 4 --count-dr20-dredge 4 --count-dr20-vrs 3'
  elif [ $type = 'praxis-node-mgmt' ]; then
    extras='--count-dr20-vrs 3'
  fi
  echo "bin/gen_zed_yaml --resource-type $type --cannonical $extras $*"
  #echo "~/git/vmop/zombie-resource/bin/gen_zed_yaml -r $type --canonical $extras > /tmp/before-$type"
  ~/git/vmop/zombie-resource/bin/gen_zed_yaml -r $type --canonical $extras $* > /tmp/before-$type
  ~/git/sholland/zombie-resource/bin/gen_zed_yaml -r $type --canonical $extras $* > /tmp/after-$type
  diff_line_count=`diff /tmp/before-$type /tmp/after-$type | wc -l | awk '{print $NF}'`
  if [ $line_count > 200 ]; then
    echo "line count greater than 200, exiting"
    exit 1
  fi
  diff /tmp/before-$type /tmp/after-$type
done
