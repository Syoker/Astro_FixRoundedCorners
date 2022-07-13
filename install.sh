SKIPMOUNT=false
PROPFILE=false
POSTFSDATA=false
LATESTARTSERVICE=false

REPLACE="
"

android_check() {
 if [[ $API < 30 ]]; then
   ui_print "• Sorry, you need Android 11 or later to use this module."
   ui_print ""
   sleep 2
   exit 1
 fi
}

print_modname() {
  ui_print ""
  ui_print "•••••••••••••••••••••••••••"
  ui_print "    Fix Rounded Corners"
  ui_print "•••••••••••••••••••••••••••"
  ui_print ""
  ui_print "• Module by Syoker"
  ui_print ""
  
  sleep 2
}

on_install() {

  android_check

  unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
  ui_print "- Extracting module files"

  if [[ $API == 30 ]]; then
    unzip $MODPATH/system/product/overlay/android11.zip -d $MODPATH/system/product/overlay/
    rm $MODPATH/system/product/overlay/android12.zip
    rm $MODPATH/system/product/overlay/android11.zip
  else
    unzip $MODPATH/system/product/overlay/android12.zip -d $MODPATH/system/product/overlay/
    rm $MODPATH/system/product/overlay/android12.zip
    rm $MODPATH/system/product/overlay/android11.zip
  fi

  ui_print "- Deleting package cache"
  rm -rf /data/system/package_cache/*
}

set_permissions() {
  set_perm_recursive $MODPATH 0 0 0755 0644
}