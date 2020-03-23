#!/bin/env bash
# Created by 弱弱的胖橘猫丷
# 2020.02.22 09:33:00


function applypatch() {
    cp 0001-audio-Fix-build-problems.patch ../../../../vendor/qcom/opensource/audio-hal/primary-hal/
    cd ../../../../vendor/qcom/opensource/audio-hal/primary-hal/
    git am 0001-audio-Fix-build-problems.patch
    cd -
    cp 0001-media-fix-build-error.patch ../../../../hardware/qcom/media/
    cd ../../../../hardware/qcom/media/
    git am 0001-media-fix-build-error.patch
    cd -
}

  applypatch
