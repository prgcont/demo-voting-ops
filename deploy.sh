#!/bin/bash

org="containers-prague"
repos="demo-result-app demo-voting-app demo-worker"

blue_green="demo-voting-app"
BG=false

tmpl_dir="templates"
mkdir -p $tmpl_dir

if [ "$1" == "blue-green" ]; then
  BG=true
fi


for i in `ls openshift/`; do oc process -f openshift/$i | oc apply -f -; done
pushd $tmpl_dir
for r in `echo $repos`; do
  f=${r#*-}
  if $BG && echo $blue_green | grep -wq $r; then
    curl -o $f.yaml https://raw.githubusercontent.com/$org/$r/master/openshift/$f.blue-green.yaml
  else
    curl -o $f.yaml https://raw.githubusercontent.com/$org/$r/master/openshift/$f.yaml
  fi
  oc process -f $f.yaml | oc apply -f -
done
popd

