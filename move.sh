#!/bin/bash

prefix=temp
suffix=$(date +%Y-%m-%d) 
filename=$prefix.$suffix
echo "das ist $SchemeName"

mv $BUILD_SOURCESDIRECTORY/output/$SDK/$CONFIGURATION/_XcodeTaskExport_hello-world/*.ipa $BUILD_SOURCESDIRECTORY/output/$SDK/$CONFIGURATION/$filename.ipa
