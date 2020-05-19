#!/bin/env sh
# Created by 弱弱的胖橘猫丷 <gesangtome@foxmail.com>
# Last update: 2020.05.19 18:14

audio_path=../../../../hardware/qcom-caf/sm8150/audio/
media_path=../../../../hardware/qcom-caf/sm8150/media/

function copy_patch_files()
{
	for files_name in *.patch;
	do
		[[ $files_name =~ "dts_eagle" ]] && cp -a $files_name $audio_path/
		[[ $files_name =~ "audio" ]] && cp -a $files_name $audio_path/
		[[ $files_name =~ "media" ]] && cp -a $files_name $media_path/
	done
}

function apply_patch_files() {
	while [ $# != 0 ];
	do
		local local_path=$1

		cd $local_path
		for files in *.patch;
		do
			local change=`cat $files | grep 'Change-Id:'| sed 's/^Change-Id: //g'`
			git log | grep $change >/dev/null 2>&1

			case $? in
				0)
					echo "This patch has been applied: $files"
					rm -rf $files
					;;
				*)
					git apply --check $files >/dev/null 2>&1
					case $? in
						0)
							echo "Applying the patch: $files"
							git am $files >/dev/null 2>&1 && rm -rf $files
							;;
						*)
							echo "Can not apply the patch: $files"
							rm -rf $files
							;;
					esac
					;;
			esac
		done
		cd - >/dev/null 2>&1
		shift
	done
}

# copy patch files
copy_patch_files

# apply patch files
apply_patch_files $audio_path $media_path

# unset 
unset audio_path
unset media_path
