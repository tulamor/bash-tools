#!/bin/bash

#Compare python generated output files with perl generated output files
localtop="CMSSW_11_2_SCRAMV3_X_2020-08-25-1100"
for OPT in USES ORIGIN USED_BY
do
  OUTPUT_DIR=${localtop}/out_test/python/"${OPT}_PYTHON"
  mkdir -p $OUTPUT_DIR
  for file in ${localtop}/.SCRAM/slc7_amd64_gcc820/tools_test/*
  do
    TOOLNAME=$(basename $file)
    python3 ${localtop}/config/SCRAM/projectInfo.py $CMSSW_BASE $OPT $TOOLNAME $SCRAM_ARCH > $OUTPUT_DIR/"${TOOLNAME}"
    stat -c "%s %n" $OUTPUT_DIR/"${TOOLNAME}"
    echo "#### comparing $TOOLNAME with ${TOOLNAME}"
    cmp $OUTPUT_DIR/"${TOOLNAME}" "CMSSW_11_2_X_2020-08-25-1100/out_test/perl/${OPT}_PERL/${TOOLNAME}"
    status=$?
    if [[ $status != 0 ]]; then
    printf "\n\n!!! Files are different !!!\n\n\n" && exit 1
    fi
  done
done