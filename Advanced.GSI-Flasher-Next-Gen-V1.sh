#!/data/data/com.termux/files/usr/bin/bash
# Cat Text colors 🐈

RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
BLUE='\033[34m'
RESET='\033[0m'
MAGENTA='\033[35m'
CYAN='\033[36m'

main_head() {
clear
echo -e "${YELLOW}======================================"
echo -e "${YELLOW}======== GSI Flasher Next Gen ========"
echo -e "${YELLOW}======================================"
}

echo -e "${RESET}"
reboot_fastboot_adb() {
  echo "-> Rebooting into fastboot... {1/23}"
  termux-adb reboot fastboot
}

erase_system() {
  echo "-> Erasing system partition... {2/23}"
  termux-fastboot erase system
}

flash_product() {
  echo "-> Flashing product image... {3/23}"
  while true; do
    echo "enter your product path : "
    read PRODUCT_IMG_PATH 
    if [ ! -f "$PRODUCT_IMG_PATH" ]; then
      echo -e "${RED}error: file $PRODUCT_IMG_PATH doesn't exist! Please try again.${RESET}"
      continue
    fi
    termux-fastboot flash product "$PRODUCT_IMG_PATH"
    if [ $? -eq 0 ]; then
      echo "file $PRODUCT_IMG_PATH flashed successfully"
    else
      echo "error: failed to flash $PRODUCT_IMG_PATH"
    fi
    break
  done
}

flash_system() {
  echo "-> Flashing system image... {4/23}"
  while true; do
    echo "enter your rom path : "
    read IMG_PATH 
    if [ ! -f "$IMG_PATH" ]; then
      echo -e "${RED}error: file $IMG_PATH doesn't exist! Please try again.${RESET}"
      continue
    fi
    termux-fastboot flash system "$IMG_PATH"
    if [ $? -eq 0 ]; then
      echo "file $IMG_PATH flashed successfully"
    else
      echo "error: failed to flash $IMG_PATH"
    fi
    break
  done
}

reboot_recovery_fastboot() {
  echo "-> Rebooting into Recovery... {5/23}"
  termux-fastboot reboot recovery
}

reboot_recovery_adb() {
  echo "-> Rebooting into Recovery... {8/23}"
  termux-adb reboot recovery
}

reboot_bootloader_adb() {
  echo "-> Rebooting into bootloader mode... {9/23}"
  termux-adb reboot bootloader
}

reboot_download_adb() {
  echo "-> Rebooting inot download mode... {10/23}"
  termux-adb reboot download
}

erase_product() {
  echo "-> Erasing product... {11/23}"
  termux-fastboot erase product
}

format() {
  echo "-> Formatting... {12/23}"
  termux-fastboot -w
}

checking_adb() {
  echo "-> Checking ADB Devices... {0/23}"
  termux-adb devices
}

reboot_download_fastboot() {
  echo "-> Rebooting into download... {7/23}"
  termux-fastboot reboot download
}

reboot_bootloader_fastboot() {
  echo "-> Rebooting into bootloader... {6/23}"
  termux-fastboot reboot bootloader
}

mitools() {
  echo "-> Running miunlock... {14/23}"
  miunlock
}

flash_vendor_boot() {
  echo "-> Flashing vendor_boot... {17/23}"
  while true; do
    echo "-> Enter your vendor_boot path : "
    read VENDORBOOT_IMG_PATH 
    if [ ! -f "$VENDORBOOT_IMG_PATH" ]; then
      echo -e "${RED}error: file $VENDORBOOT_IMG_PATH doesn't exist! Please try again.${RESET}"
      continue
    fi
    termux-fastboot flash vendor_boot "$VENDORBOOT_IMG_PATH"
    if [ $? -eq 0 ]; then
      echo "file $VENDORBOOT_IMG_PATH flashed successfully"
    else
      echo "error: failed to flash $VENDORBOOT_IMG_PATH"
    fi
    break
  done
}

flash_init_boot() {
  echo "-> Flashing init_boot... {18/23}"
  while true; do
    echo "-> Enter your init_boot path : "
    read INITBOOT_IMG_PATH 
    if [ ! -f "$INITBOOT_IMG_PATH" ]; then
      echo -e "${RED}error: file $INITBOOT_IMG_PATH doesn't exist! Please try again.${RESET}"
      continue
    fi
    termux-fastboot flash init_boot "$INITBOOT_IMG_PATH"
    if [ $? -eq 0 ]; then
      echo "file $INITBOOT_IMG_PATH flashed successfully"
    else
      echo "error: failed to flash $INITBOOT_IMG_PATH"
    fi
    break
  done
}

flash_boot() {
  echo "-> Flashing boot... {19/23}"
  while true; do
    echo "enter your boot path : "
    read BOOT_IMG_PATH 
    if [ ! -f "$BOOT_IMG_PATH" ]; then
      echo -e "${RED}error: file $BOOT_IMG_PATH doesn't exist! Please try again.${RESET}"
      continue
    fi
    termux-fastboot flash boot "$BOOT_IMG_PATH"
    if [ $? -eq 0 ]; then
      echo "file $BOOT_IMG_PATH flashed successfully"
    else
      echo "error: failed to flash $BOOT_IMG_PATH"
    fi
    break
  done
}

flash_recovery() {
  echo "-> Flashing recovery... {20/23}"
  while true; do
    echo "enter your recovery path : "
    read RECOVERY_IMG_PATH 
    if [ ! -f "$RECOVERY_IMG_PATH" ]; then
      echo -e "${RED}error: file $RECOVERY_IMG_PATH doesn't exist! Please try again.${RESET}"
      continue
    fi
    termux-fastboot flash recovery "$RECOVERY_IMG_PATH"
    if [ $? -eq 0 ]; then
      echo "file $RECOVERY_IMG_PATH flashed successfully"
    else
      echo "error: failed to flash $RECOVERY_IMG_PATH"
    fi
    break
  done
}

flash_vbmeta_disabled() {
  echo "-> Flashing vbmeta_disabled image... {15/23}"
  while true; do
    echo "enter your vbmeta path : "
    read VBMETA_DISABLED_IMG_PATH 
    if [ ! -f "$VBMETA_DISABLED_IMG_PATH" ]; then
      echo -e "${RED}error: file $VBMETA_DISABLED_IMG_PATH doesn't exist! Please try again.${RESET}"
      continue
    fi
    termux-fastboot --disable-verity --disable-verification flash vbmeta "$VBMETA_DISABLED_IMG_PATH"
    if [ $? -eq 0 ]; then
      echo "file $VBMETA_DISABLED_IMG_PATH flashed successfully"
    else
      echo "error: failed to flash $VBMETA_DISABLED_IMG_PATH"
    fi
    break
  done
}

flash_vbmeta_system_disabled() {
  echo "-> Flashing vbmeta_system_disabled image... {16/23}"
  while true; do
    echo "enter your vbmeta_system path : "
    read VBMETA_SYSTEM_IMG_PATH 
    if [ ! -f "$VBMETA_SYSTEM_IMG_PATH" ]; then
      echo -e "${RED}error: file $VBMETA_SYSTEM_IMG_PATH doesn't exist! Please try again.${RESET}"
      continue
    fi
    termux-fastboot --disable-verity --disable-verification flash vbmeta_system "$VBMETA_SYSTEM_IMG_PATH"
    if [ $? -eq 0 ]; then
      echo "file $VBMETA_SYSTEM_IMG_PATH flashed successfully"
    else
      echo "error: failed to flash $VBMETA_SYSTEM_IMG_PATH"
    fi
    break
  done
}

flash_vbmeta() {
  echo "-> Flashing vbmet image... {21/23}"
  while true; do
    echo "enter your vbmeta path : "
    read VBMETA_IMG_PATH 
    if [ ! -f "$VBMETA_IMG_PATH" ]; then
      echo -e "${RED}error: file $VBMETA_IMG_PATH doesn't exist! Please try again.${RESET}"
      continue
    fi
    termux-fastboot flash vbmeta "$VBMETA_IMG_PATH"
    if [ $? -eq 0 ]; then
      echo "file $VBMETA_IMG_PATH flashed successfully"
    else
      echo "error: failed to flash $VBMETA_IMG_PATH"
    fi
    break
  done
}

flash_vbmeta_system() {
  echo "-> Flashing vbmet_system image... {22/23}"
  while true; do
    echo "enter your vbmeta_system path : "
    read VBMETA_SYSTEM_IMG_PATH 
    if [ ! -f "$VBMETA_SYSTEM_IMG_PATH" ]; then
      echo -e "${RED}error: file $VBMETA_SYSTEM_IMG_PATH doesn't exist! Please try again.${RESET}"
      continue
    fi
    termux-fastboot flash vbmeta_system "$VBMETA_SYSTEM_IMG_PATH"
    if [ $? -eq 0 ]; then
      echo "file $VBMETA_SYSTEM_IMG_PATH flashed successfully"
    else
      echo "error: failed to flash $VBMETA_SYSTEM_IMG_PATH"
    fi
    break
  done
}

adb_sideload() {
  echo "-> Flashing Adb file... {23/23}"
  while true; do
    echo "enter your file path : "
    read SIDELOAD_IMG_PATH 
    if [ ! -f "$PRODUCT_IMG_PATH" ]; then
      echo -e "${RED}error: file $SIDELOAD_IMG_PATH doesn't exist! Please try again.${RESET}"
      continue
    fi
    termux-adb sideload "$SIDELOAD_IMG_PATH"
    if [ $? -eq 0 ]; then
      echo "file $SIDELOAD_IMG_PATH flashed successfully"
    else
      echo "error: failed to flash $SIDELOAD_IMG_PATH"
    fi
    break
  done
}

install_recouruments() { 
  echo "Installing Recouruments..."
  apt update -y && apt upgrade -y
  curl -s https://raw.githubusercontent.com/nohajc/termux-adb/master/install.sh | bash
  curl -sS https://raw.githubusercontent.com/offici5l/MiTool/master/install.sh | bash
}

Run_all_steps_in_sequence() {
reboot_fastboot
sleep 2
erase_system
sleep 1
flash_product
sleep 1
flash_system
sleep 1
reboot_recovery
sleep 2
}

leaving() {
echo "Exiting..."
exit 0
}

menu() {
  echo ""
  echo -e "Select a step to execute : "
  echo -e ""
  echo -e "${BLUE} 0) Check adb devices    (ADB)"
  echo -e "${BLUE} 1) Reboot to fastboot   (ADB)"
  echo -e "${GREEN} 2) Erase system         (Fastboot)"
  echo -e " 3) Flash product        (Fastboot)"
  echo -e " 4) Flash system         (Fastboot)"
  echo -e " 5) Reboot to Recovery   (Fastboot)"
  echo -e " 6) Reboot to Bootloader (Fastboot)"
  echo -e " 7) Reboot to Download   (Fastboot)"
  echo -e "${BLUE} 8) Reboot to Recovery   (ADB)"
  echo -e " 9) Reboot to Bootloader (ADB)"
  echo -e "10) Reboot to Download   (ADB)"
  echo -e "${GREEN}11) Erase product        (Fastboot)"
  echo -e "12) Format               (fastboot -w)"
  echo -e "${CYAN}13) Run all steps in sequence (1 → 5)"
  echo -e "14) Miunlock (a tool for Xiaomi devices)"
  echo -e "${GREEN}15) Flash recovery               (Fastboot)"
  echo -e "16) Flash boot                   (Fastboot)"
  echo -e "17) Flash init_boot              (Fastboot)"
  echo -e "18) Flash vendor_boot            (Fastboot)"
  echo -e "19) Flash vbmeta                 (Fastboot)"
  echo -e "20) Flash vbmeta_system          (Fastboot)"
  echo -e "21) Flash vbmeta disabled        (Fastboot)"
  echo -e "22) Flash vbmeta_system disabled (Fastboot)"
  echo -e "${BLUE}24) Sideload Flashing            (ADB)"
  echo -e "${CYAN} q)  Quit"
  echo -e "${RESET}"
  read -p "Your choice : " choice
  #
}

# Cat loop Meow (the most powerfule loop)
while true; do
  main_head
  menu
  case "$choice" in
    0) checking_adb ;;
    1) reboot_fastboot_adb ;;
    2) erase_system ;;
    3) flash_product ;;
    4) flash_system ;;
    5) reboot_recovery_fastboot ;;
    6) reboot_bootloader_fastboot ;;
    7) reboot_download_fastboot ;;
    8) reboot_recovery_adb ;;
    9) reboot_bootloader_adb ;;
    10) reboot_download_adb ;;
    11) erase_product ;;
    12) format ;;
    13) Run_all_steps_in_sequence ;;
    14) miunlock ;;
    15) flash_recovery ;;
    16) flash_boot ;;
    17) flash_init_boot ;;
    18) flash_vendor_boot ;;
    19) flash_vbmeta ;;
    20) flash_vbmeta_system ;;
    21) flash_vbmeta_disabled ;;
    22) flash_vbmeta_system_disabled ;;
    23) adb_sideload ;;
    install) install_recouruments ;;
    q|Q) leaving ;;
    *) echo "Invalid option, please try again." ;;
  esac

  echo ""
  read -p "Do you want to perform another action? (y/n): " again
  if [[ "$again" != "y" && "$again" != "Y" ]]; then
    echo "Done."
    exit 0
  fi
  clear
done
#😺🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈🐈😺