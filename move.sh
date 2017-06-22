#!/bin/bash

prefix=$SCHEMENAME
suffix=$(date +%Y-%m-%d) 
filename=$prefix_$suffix


mv $BUILD_SOURCESDIRECTORY/output/$SDK/$CONFIGURATION/_XcodeTaskExport_hello-world/*.ipa $BUILD_SOURCESDIRECTORY/output/$SDK/$CONFIGURATION/$filename.ipa
