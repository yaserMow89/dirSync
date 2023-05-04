#!/bin/bash


# -----------------------------------------------------------------------
# Function definitions - start


funcDirValidity () {
if [ -d "$1" ]; then
    VALIDITY_CHECK="PASSED"
    echo "$STR_DIR_ACK"
else 
    VALIDITY_CHECK="FAILED"
fi
}


funcListDir () {
    ls -R "$1"
}

# -----------------------------------------------------------------------
# Function definitions - stop


STR_DIR_ACK="The directory exists" 
STR_ASK_DIR_LOCATION="Please enter the directory location that you want to sync: "

echo "$STR_ASK_DIR_LOCATION"
read LOCAL_DIR_LOCATION
funcDirValidity "$LOCAL_DIR_LOCATION"


while [ "$VALIDITY_CHECK" != "PASSED" ]; do
    echo "The directory does not exist"
    echo "$STR_ASK_DIR_LOCATION"
    read LOCAL_DIR_LOCATION
    funcDirValidity "$LOCAL_DIR_LOCATION"
    
done


funcListDir "$LOCAL_DIR_LOCATION"


