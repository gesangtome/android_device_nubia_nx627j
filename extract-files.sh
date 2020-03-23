#!/bin/bash
# Created by 弱弱的胖橘猫丷

source ../../../vendor/pa/build/tools/extract_utils.sh

function device_root_check() {
    adb shell "type su" > /dev/null 2>&1

    if [ "$?" != "0" ];
    then
        return 1
    fi
}

function device_selinux_check() {
    selinux_status=`adb shell "getenforce"`

    if [ "$selinux_status" == "Enforcing" ];
    then
        disable_selinux=1
    else
        disable_selinux=0
    fi
}

function selinux_disable() {
    selinux_status=`adb shell "su -c 'setenforce 0'" > /dev/null 2>&1`
}

# Waiting for device to connect
  init_adb_connection

# Check device root status
  printf "Checking device root status.\n" & device_root_check

  if [ "$?" == 1 ];
  then
    printf "Device root detection failed, abort...\n"
    exit 1
  fi

# Check selinux root status
  printf "Checking device selinux status.\n" & device_selinux_check

  if [ "$disable_selinux" == 1 ];
  then
        printf "Disable device SELinux.\n" & selinux_disable
  fi

  ./pull_adb.sh
