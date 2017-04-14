#!/bin/bash

org="containers-prague"
repos="demo-result-app demo-voting-app demo-worker"

tmpl_dir="templates"
mkdir -p $tmpl_dir


for i in `ls openshift/`; do oc process -f openshift/$i | oc apply -f -; done
pushd $tmpl_dir
for r in `echo $repos`; do
  f=${r#*-}
  curl -O https://raw.githubusercontent.com/$org/$r/master/openshift/$f.yaml
  oc process -f $f.yaml | oc apply -f -
done
popd

