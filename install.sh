SKIPMOUNT=false
PROPFILE=false
POSTFSDATA=false
LATESTARTSERVICE=false
API_SUPPORT_MIN=30

REPLACE="
"

android_check() {
 if [[ $API < API_SUPPORT_MIN ]]; then
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

  if [[ $API == API_SUPPORT_MIN ]]; then
    ui_print "- Extracting module files"
    unzip -o "$ZIPFILE" 'system30/*' -d $MODPATH >&2
  else
    ui_print "- Extracting module files"
    unzip -o "$ZIPFILE" 'system31+/*' -d $MODPATH >&2
  fi

  ui_print "- Deleting package cache"
  rm -rf /data/system/package_cache/*
}

set_permissions() {
  set_perm_recursive $MODPATH 0 0 0755 0644
}