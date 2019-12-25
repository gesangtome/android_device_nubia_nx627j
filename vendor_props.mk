# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.audio.voicecall.speaker.stereo=false \
    persist.vendor.audio.fluence.voicecall=true \
    persist.vendor.audio.fluence.voicerec=false \
    persist.vendor.audio.fluence.speaker=false \
    persist.vendor.audio.avs.afe_api_version=2 \
    persist.vendor.audio.ras.enabled=false \
    persist.vendor.audio.spv3.enable=true \
    ro.vendor.audio.sdk.fluencetype=fluence \
    ro.vendor.audio.sdk.ssr=false \
    ro.vendor.audio.parameter.ver=V12.0.18 \
    ro.vendor.audio.dts.ver=V12.02.09 \
    ro.vendor.audio.pa.ver=V12.0.7 \
    ro.vendor.audio.internal.ver=V12.90.0.2 \
    vendor.audio.tunnel.encode=false \
    vendor.audio.offload.buffer.size.kb=32 \
    vendor.audio.offload.track.enable=true \
    vendor.audio.offload.multiaac.enable=true \
    vendor.audio.dolby.ds2.enabled=false \
    vendor.audio.dolby.ds2.hardbypass=false \
    vendor.audio.offload.multiple.enabled=false \
    vendor.audio.offload.passthrough=false \
    vendor.audio.offload.gapless.enabled=true \
    vendor.audio.safx.pbe.enabled=true \
    vendor.audio.parser.ip.buffer.size=0 \
    vendor.audio.flac.sw.decoder.24bit=true \
    vendor.audio.use.sw.alac.decoder=true \
    vendor.audio.use.sw.ape.decoder=true \
    vendor.audio.hw.aac.encoder=true \
    vendor.audio.noisy.broadcast.delay=600 \
    vendor.audio.offload.pstimeout.secs=3 \
    vendor.audio.adm.buffering.ms=2 \
    vendor.audio.enable.mirrorlink=false \
    vendor.audio_hal.period_size=192 \
    vendor.audio_hal.in_period_size=144 \
    vendor.audio_hal.period_multiplier=3 \
    vendor.audio.hal.output.suspend.supported=false \
    vendor.audio.noise.reduction.for.voice.call=false \
    vendor.voice.path.for.pcm.voip=true

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.qcom.bluetooth.soc=cherokee \
    vendor.bluetooth.soc=cherokee \
    persist.vendor.bt.aac_frm_ctl.enabled=true \
    persist.vendor.bt.a2dp_offload_cap=sbc-aptx-aptxhd-aac-ldac
    ro.vendor.bluetooth.emb_wp_mode=false \
    ro.vendor.bluetooth.wipower=false

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.camera.exif.model=nubia Z20 \
    ro.vendor.camera.internal.id=V16.90.0.102 \
    vendor.camera.aux.packagelist=com.android.camera,cn.nubia.factory,org.codeaurora.snapcam

# Charger
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.standard_charger=USB_HVDCP_3

# CNE Module
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.cne.feature=1

# Crypto
PRODUCT_PROPERTY_OVERRIDES += \
    ro.crypto.volume.filenames_mode=aes-256-cts \
    ro.crypto.allow_encrypt_override=true

# Data
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.use_data_netmgrd=true \
    persist.vendor.data.mode=concurrent

# DPM
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.dpm.feature=9

# Display
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.display.cabl=2 \
    vendor.display.enable_rotator_ui=1 \
    vendor.display.comp_mask=0 \
    vendor.display.builtin_mirroring=0 \
    vendor.display.builtin_presentation=true \
    vendor.display.disable_scaler=0 \
    vendor.display.disable_inline_rotator=1 \
    vendor.display.disable_decimation=1 \
    vendor.display.enable_null_display=0 \
    vendor.display.disable_excl_rect=0 \
    vendor.display.enable_optimize_refresh=1 \
    vendor.display.disable_hw_recovery_dump=1 \
    vendor.display.dataspace_saturation_matrix=1.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,1.0

# DRM
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

# Fingerprint
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.qfp=true

# FRP
PRODUCT_PROPERTY_OVERRIDES += \
    ro.frp.pst=/dev/block/bootdevice/by-name/frp

# Gatekeeper
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.gatekeeper.disable_spu=true

# GPS
PRODUCT_PROPERTY_OVERRIDES += \
    persist.backup.ntpServer=0.pool.ntp.org \
    persist.vendor.overlay.izat.optin=rro

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    debug.egl.hw=0 \
    debug.mdpcomp.logs=0 \
    debug.sf.hw=0 \
    debug.sf.latch_unsignaled=1 \
    persist.demo.hdmirotationlock=false \
    persist.sys.sf.color_saturation=1.0 \
    vendor.display.enable_default_color_mode=1 \
    vendor.gralloc.disable_ubwc=0

# IMS
PRODUCT_PROPERTY_OVERRIDES += \
    persist.rcs.supported=1 \
    persist.dbg.volte_avail_ovr=1 \
    persist.dbg.vt_avail_ovr=1 \
    persist.dbg.wfc_avail_ovr=1

# IOP
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.iop.enable_uxe=1 \
    vendor.perf.iop_v3.enable=true \
    vendor.perf.gestureflingboost.enable=false \
    vendor.perf.workloadclassifier.enable=true

# Increase cached app limit
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.qti.sys.fw.bg_apps_limit=60

# Keystore
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.keystore_desede=true

# Hardware
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.vulkan=adreno \
    ro.hardware.egl=adreno

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.swvdec.log.level=1 \
    vendor.vidc.debug.level=1

# Memory optimizations
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.qti.sys.fw.bservice_age=5000 \
    ro.vendor.qti.sys.fw.bservice_enable=true \
    ro.vendor.qti.sys.fw.bservice_limit=8

# NFC
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.nfc_nci=nqx.default

# Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=libqti-perfd-client.so \
    ro.vendor.scroll.preobtain.enable=false

# Qualcomm System Daemon
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.qcomsysd.enabled=1

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.radio.atfwd.start=true \
    persist.vendor.radio.apm_sim_not_pwdn=1 \
    persist.vendor.radio.custom_ecc=1 \
    persist.vendor.radio.rat_on=combine \
    persist.vendor.radio.sib16_support=1 \
    persist.vendor.radio.primarycard=true \
    persist.vendor.radio.custom_ecc=0 \
    persist.vendor.radio.apm_sim_not_pwdn=1 \
    persist.vendor.radio.sib16_support=1 \
    persist.vendor.radio.rat_on=combine \
    persist.radio.multisim.config=dsds

# Services
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.service.bdroid.ssrlvl=3 \
    persist.vendor.service.bdroid.fwsnoop=true

# Sensors
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.sensors.enable.mag_filter=true

# Thermal
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.thermal.product=3 \
    persist.vendor.product.perf=1

# Unknown
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.language=zh \
    persist.sys.country=CN \
    persist.sys.indication_max=50 \
    persist.sys.systrace.enable=0 \
    persist.sys.systrace.platform=1 \
    persist.sys.systrace.success=1 \
    persist.sys.prop.changed=true \
    persist.sys.support.fan=false \
    persist.sys.support.dock=false \
    persist.sys.design_capacity=4000000 \
    persist.sys.design_charge_cycle=700 \
    persist.sys.lcd.backlight.max=4095 \
    persist.sys.lcd.nubia_mode=0 \
    persist.factory.receiver_volume=10 \
    persist.factory.loopback_volume=10 \
    persist.vendor.factory.mic_number=12 \
    persist.vendor.qcomsysd.enabled=1 \
    persist.vendor.factory.color_light=false \
    persist.vendor.factory.keypad_type=standard_with_virtual_key \
    persist.vendor.factory.shift_switch_key=false \
    persist.vendor.factory.touch_key=false \
    persist.vendor.factory.support_accel=yes \
    persist.vendor.factory.accel606_cali=true \
    persist.vendor.factory.smartPA=true \
    persist.vendor.factory.gtp_touch=true \
    persist.vendor.factory.press_touch=true \
    persist.vendor.factory.double_power=true \
    persist.vendor.ssr.restart_level=3 \
    persist.vendor.ap.restart_level=0 \
    ro.vendor.poweroff_store_log=/persist \
    ro.vendor.poweroff_outchannel=4864 \
    ro.vendor.poweroff_breath_type=1 \
    ro.vendor.poweroff_breath_bright_dir=/sys/class/leds/nubia_led/grade_parameter \
    ro.vendor.poweroff_breath_brightness=128 \
    ro.vendor.poweroff_breath_blink=/sys/class/leds/nubia_led/blink_mode \
    ro.vendor.poweroff_led_maxbright_dir=/sys/class/backlight/panel0-backlight/max_brightness \
    ro.vendor.poweroff_led_brightness_dir=/sys/class/backlight/panel0-backlight/brightness \
    ro.vendor.poweroff_led_red_brightness=/sys/clas/leds/red/brightness \
    ro.vendor.poweroff_led_green_brightness=/sys/clas/leds/green/brightness \
    sys.vendor.shutdown.waittime=500 \
    vendor.hw.fm.init=0 \
    vendor.wc_transport.force_special_byte=true
