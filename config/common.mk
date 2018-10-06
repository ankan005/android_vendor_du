PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

# General additions
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    dalvik.vm.debug.alloc=0 \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dataroaming=false \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent \
    ro.com.android.dateformat=MM-dd-yyyy \
    persist.debug.wfd.enable=1 \
    persist.sys.wfd.virtual=0 \
    ro.setupwizard.rotation_locked=true \
    ro.build.selinux=1

# Allow tethering without provisioning app
PRODUCT_PROPERTY_OVERRIDES += \
    net.tethering.noprovisioning=true

PRODUCT_COPY_FILES += \
    vendor/du/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/du/prebuilt/common/bin/sysinit:system/bin/sysinit

# Init files
PRODUCT_COPY_FILES += \
    vendor/du/prebuilt/common/etc/init.local.rc:system/etc/init/dirtyunicorns.rc

# LatinIME gesture typing
ifneq ($(filter tenderloin,$(TARGET_PRODUCT)),)
ifneq ($(filter shamu,$(TARGET_PRODUCT)),)
PRODUCT_COPY_FILES += \
    vendor/du/prebuilt/common/lib/libjni_latinime.so:system/lib/libjni_latinime.so \
    vendor/du/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so
else
PRODUCT_COPY_FILES += \
    vendor/du/prebuilt/common/lib64/libjni_latinime.so:system/lib64/libjni_latinime.so \
    vendor/du/prebuilt/common/lib64/libjni_latinimegoogle.so:system/lib64/libjni_latinimegoogle.so
endif
endif

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    vendor/du/prebuilt/common/etc/mkshrc:system/etc/mkshrc

# Backup tool
PRODUCT_COPY_FILES += \
    vendor/extras/build/tools/backuptool.sh:install/bin/backuptool.sh \
    vendor/extras/build/tools/backuptool.functions:install/bin/backuptool.functions \
    vendor/extras/build/tools/50-du.sh:system/addon.d/50-du.sh

# Optional packages
PRODUCT_PACKAGES += \
    Basic \
    LiveWallpapersPicker \
    PhaseBeam

# Include explicitly to work around GMS issues
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    librsjni

# AudioFX
PRODUCT_PACKAGES += \
    AudioFX

# Extra Optional packages
PRODUCT_PACKAGES += \
    Calculator \
    LatinIME \
    BluetoothExt \
    OmniJaws \
    OmniStyle

# Xtended Packages
PRODUCT_PACKAGES += \
    LeanLauncher

# Omni Poor Man Themes
PRODUCT_PACKAGES += \
    DocumentsUITheme \
    DialerTheme \
    TelecommTheme

PRODUCT_PACKAGES += \
    NotificationsXtended \
    NotificationsBlack \
    NotificationsDark \
    NotificationsLight \
    NotificationsPrimary

PRODUCT_PACKAGES += \
    AccentSluttyPink \
    AccentPixel \
    AccentGoldenShower \
    AccentDeepOrange \
    AccentOmni \
    AccentWhite \
    AccentTeal \
    AccentFromHell \
    AccentBlueMonday \
    AccentSmokingGreen \
    AccentDeadRed \
    AccentRottenOrange \
    AccentDeepPurple

PRODUCT_PACKAGES += \
    PrimaryAlmostBlack \
    PrimaryBlack \
    PrimaryXtended \
    PrimaryOmni \
    PrimaryWhite \
    PrimaryColdWhite \
    PrimaryWarmWhite \
    PrimaryDarkBlue

# CustomDoze
PRODUCT_PACKAGES += \
    CustomDoze

# DU Utils Library
#PRODUCT_BOOT_JARS += \
    org.dirtyunicorns.utils

# DU Utils Library
#PRODUCT_PACKAGES += \
    org.dirtyunicorns.utils

# Fonts
#PRODUCT_PACKAGES += \
    DU-Fonts

# Extra tools
PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs \
    fsck.exfat \
    mkfs.exfat \
    ntfsfix \
    ntfs-3g \
    mkfs.ntfs \
    fsck.ntfs \
    mount.ntfs \
    mkfs.f2fs \
    fsck.f2fs \
    fibmap.f2fs \
    libsepol \
    nano \
    htop \
    gdbserver \
    micro_bench \
    oprofiled \
    sqlite3 \
    strace \
    pigz \
    7z \
    lib7z \
    bash \
    bzip2 \
    curl \
    powertop \
    unrar \
    unzip \
    vim \
    wget \
    zip

# Xtended Stuff - Copy to System fonts
>>>>>>> 0eed3ec... Add Xtended Theme [1/2]
PRODUCT_COPY_FILES += \
    vendor/du/etc/permissions/org.pixelexperience.weather.client.xml:system/etc/permissions/org.pixelexperience.weather.client.xml \
    vendor/du/etc/default-permissions/org.pixelexperience.weather.client.xml:system/etc/default-permissions/org.pixelexperience.weather.client.xml

# Packages
include vendor/du/config/packages.mk

# Branding
include vendor/du/config/branding.mk

# Themes
include vendor/themes/common.mk

# Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/du/overlay/common

#Musicfx
PRODUCT_PACKAGES += \
    Recorder \
