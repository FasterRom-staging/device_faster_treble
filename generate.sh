#!/bin/bash

echo 'PRODUCT_MAKEFILES := \' > AndroidProducts.mk

for part in a ab;do
	for apps in vanilla gapps ;do
		for arch in arm64;do
			for su in yes no;do
				apps_suffix=""
				apps_script=""
				apps_name=""
				extra_packages=""
				if [ "$apps" == "gapps" ];then
					apps_suffix="g"
					apps_script='$(call inherit-product, device/faster/treble/gapps.mk)'
					apps_name="with GApps"
				fi
				if [ "$apps" == "vanilla" ];then
					apps_suffix="v"
					apps_script=''
					apps_name="vanilla"
				fi

				part_suffix='a'
				if [ "$part" == 'ab' ];then
					part_suffix='b'
				fi

				target="treble_${arch}_${part_suffix}${apps_suffix}${su_suffix}"

				cat > ${target}.mk << EOF
include build/make/target/product/treble_common.mk
\$(call inherit-product, device/faster/treble/base.mk)
$apps_script

PRODUCT_NAME := $target
PRODUCT_DEVICE := generic_arm64_$part
PRODUCT_BRAND := Android
PRODUCT_MODEL := FasterRom-Treble $apps_name

PRODUCT_PACKAGES += $extra_packages
EOF
echo -e '\t$(LOCAL_DIR)/'$target.mk '\' >> AndroidProducts.mk
			done
		done
	done
done
echo >> AndroidProducts.mk
