#!/bin/bash

prefix=temp
suffix=$(date +%Y-%m-%d)  # The "+%s" option to 'date' is GNU-specific.
filename=$prefix.$suffix
echo "das ist $SCHEME"

mv $BUILD_SOURCESDIRECTORY/output/$SDK/$CONFIGURATION/_XcodeTaskExport_hello-world/*.ipa $BUILD_SOURCESDIRECTORY/output/$SDK/$CONFIGURATION/$filename.ipa
# #!/bin/bash
# echo "Hello World"
# echo "AGENT_WORKFOLDER is $AGENT_WORKFOLDER"
# echo "AGENT_WORKFOLDER contents:"
# ls -1 $AGENT_WORKFOLDER
# echo "AGENT_BUILDDIRECTORY is $AGENT_BUILDDIRECTORY"
# echo "AGENT_BUILDDIRECTORY contents:"
# ls -1 $AGENT_BUILDDIRECTORY
# echo "BUILD_SOURCESDIRECTORY is $BUILD_SOURCESDIRECTORY"
# echo "BUILD_SOURCESDIRECTORY contents:"
# ls -1 $BUILD_SOURCESDIRECTORY
# echo "Over and out."