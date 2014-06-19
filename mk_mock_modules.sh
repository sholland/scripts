#!/bin/bash

puppet_dir=/etc/puppetlabs/puppet/modules
mock_mod_dir=~/git/sholland/mock-modules

[ -e $mock_mod_dir ] || mkdir -p $mock_mod_dir

for dir in `ls $puppet_dir`
do
   ln -s ${puppet_dir}/$dir ${mock_mod_dir}/$dir
done
