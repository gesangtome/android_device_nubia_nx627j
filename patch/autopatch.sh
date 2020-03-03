#!/bin/env sh
# Created by 弱弱的胖橘猫丷 <gesangtome@foxmail.com>
# Last update: 2020.03.03 12:53

audio=../../../../hardware/qcom-caf/sm8150/audio/
media=../../../../hardware/qcom-caf/sm8150/media/

function applypatch() {
    while [ $# != 0 ]; do
          
      [[ $1 =~ "audio" ]] &&  patchfile=audio.patch
      [[ $1 =~ "media" ]] &&  patchfile=media.patch

      cp -a $patchfile $1
      cd $1

      ChangeID=`cat $patchfile | grep 'Change-Id:' | sed 's/Change-Id: //g'`
      git log | grep $ChangeID >/dev/null 2>&1

      case $? in
        0)
          printf "The patch has been applied to the workspace, skiping ...\n"
          rm -rf $patchfile
          cd - >/dev/null 2>&1
          ;;
        *)
          printf "The patch was not applied to the workspace, applying ...\n"
          git am $patchfile 2> /dev/null
          rm -rf $patchfile
          cd - >/dev/null 2>&1
          ;;
      esac
          shift;
    done
}

  applypatch $audio $media

  unset audio
  unset media
