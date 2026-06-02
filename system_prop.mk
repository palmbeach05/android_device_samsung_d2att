# system.prop for d2-unified

# Audio & Voice Processing
PRODUCT_PROPERTY_OVERRIDES += \
    audio.offload.disable=1 \
    ro.qc.sdk.audio.fluencetype=fluence \
    persist.audio.fluence.voicecall=true \
    persist.audio.fluence.voicerec=false \
    persist.audio.fluence.speaker=true \
    use.dedicated.device.for.voip=true \
    use.voice.path.for.pcm.voip=true \
    ro.config.vc_call_vol_steps=10 \
    qcom.hw.aac.encoder=true

# Display & Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320 \
    debug.composition.type=dyn \
    ro.opengles.version=131072

# RIL & Telephony
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libsec-ril.so \
    rild.libargs=-d /dev/smd0 \
    ro.telephony.ril_class=d2lteRIL \
    telephony.lteOnGsmDevice=1 \
    ro.telephony.default_network=9
    persist.radio.add_power_save=1 \
    persist.radio.mode_pref_nv10=1 \
    persist.radio.no_wait_for_card=0

# GPS & Qualcomm Data/Location
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sdk.izat.premium_enabled=0 \
    ro.qc.sdk.izat.service_mask=0x0 \
    persist.gps.qc_nlp_in_use=0 \
    ro.gps.agps_provider=1 \
    persist.data_netmgrd_nint=16 \
    persist.timed.enable=true

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    persist.camera.zsl.prop.enable=0
    camera2.portability.force_api=1 \

# Stagefright
PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.legacyencoder=true \
    media.stagefright.less-secure=true

# Connectivity Interfaces & Charging
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    ro.enable_boot_charger_mode=1

# ART
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-flags=--no-watch-dog \
    dalvik.vm.dex2oat-swap=false

# libhwui Configuration
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.texture_cache_size=48 \
    ro.hwui.layer_cache_size=32 \
    ro.hwui.r_buffer_cache_size=4 \
    ro.hwui.path_cache_size=24 \
    ro.hwui.gradient_cache_size=1 \
    ro.hwui.drop_shadow_cache_size=5 \
    ro.hwui.texture_cache_flushrate=0.5 \
    ro.hwui.text_small_cache_width=1024 \
    ro.hwui.text_small_cache_height=1024 \
    ro.hwui.text_large_cache_width=2048 \
    ro.hwui.text_large_cache_height=1024