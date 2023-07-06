#! /bin/bash

echo sourcing file: $1
. $1

A1=$NAME:$REALM:$PASS
echo A1="\"$A1\""


A2=$METHOD:$URI
echo A2="\"$A2\""


HA1=`echo -n $A1 | md5sum  - | cut -d' ' -f1`
echo HA1="\"$HA1\""


HA2=`echo -n $A2 |  md5sum - | cut -d' ' -f1`
echo HA2="\"$HA2\""



FINAL=$HA1:$NONCE_VAL:$NC_VAL:$CNONCE_VAL:$QOP_VAL:$HA2
echo FINAL="\"$FINAL\""


RESPONSE=`echo -n $FINAL | md5sum | cut -d' ' -f1`
echo RESPONSE="$RESPONSE"

echo EXPECTED=$EXPECTED
