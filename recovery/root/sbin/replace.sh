#!/sbin/sh

WORKSPACE=/sbin

COPY=`which cp`
REPLACE=`which sed`
CHMOD=`which chmod`
SETPROP=`which setprop`
DELETE=`which rm`

function replace()
{
    ${COPY} $1 ${1}_old
    ${REPLACE} 's|/system/bin/linker64|///////sbin/linker64|' "${1}_old" > "$1"
    ${DELETE} -rf ${1}_old
    ${CHMOD} 755 $1
}

replace ${WORKSPACE}/qseecomd
replace ${WORKSPACE}/android.hardware.gatekeeper@1.0-service-qti
replace ${WORKSPACE}/android.hardware.keymaster@3.0-service-qti
replace ${WORKSPACE}/android.hardware.keymaster@4.0-service-qti
replace ${WORKSPACE}/android.hardware.vibrator@1.0-service

${SETPROP} crypto.ready 1
