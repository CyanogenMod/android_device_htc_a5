add_lunch_combo cm_a5-eng
add_lunch_combo cm_a5-userdebug

echo "Apply patch to frameworks/base"
echo -n "Apply patch 0001-use-some-RIL-Constants-from-stock.patch"
(cd frameworks/base; git am ../../device/htc/a5/patches/0001-use-some-RIL-Constants-from-stock.patch) > /dev/null 2>&1
if [ $? == 0 ]; then
	echo "     [DONE]"
else
	(cd frameworks/base; git am --abort)
	echo "     [FAIL]"
fi
