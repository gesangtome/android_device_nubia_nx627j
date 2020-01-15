#!/bin/env bash
# Created by 弱弱的胖橘猫丷
# 2020.01.15 08:48:00


function applypatch() {
    cp 0001-audio-Fix-compilation-error.patch ../../../../hardware/qcom-caf/sm8150/audio
    cd ../../../../hardware/qcom-caf/sm8150/audio
    git am 0001-audio-Fix-compilation-error.patch
    cd -
    cp 0001-media-fix-build-error.patch ../../../../hardware/qcom-caf/sm8150/media
    cd ../../../../hardware/qcom-caf/sm8150/media
    git am 0001-media-fix-build-error.patch
    cd -
}

  applypatch
