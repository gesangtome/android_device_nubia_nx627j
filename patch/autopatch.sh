#!/bin/env bash
# Created by 弱弱的胖橘猫丷
# 2020.02.22 09:33:00


function applypatch() {
    cp 0001-audio-Fix-build-problems.patch ../../../../hardware/qcom-caf/sm8150/audio/
    cd ../../../../hardware/qcom-caf/sm8150/audio/
    git am 0001-audio-Fix-build-problems.patch
    cd -
    cp 0001-media-fix-build-error.patch ../../../../hardware/qcom-caf/sm8150/media/
    cd ../../../../hardware/qcom-caf/sm8150/media/
    git am 0001-media-fix-build-error.patch
    cd -
}

  applypatch
