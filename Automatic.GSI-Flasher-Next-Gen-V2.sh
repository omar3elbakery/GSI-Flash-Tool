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
echo -e "${YELLOW}"
echo "======================================"
echo "======== GSI Flasher Next Gen ========"
echo "======================================"
}

reboot_fastboot() {
  echo "-> Rebooting into fastboot... {1/6}"
  termux-adb reboot fastboot
}

erase_system() {
  echo "-> Erasing system partition... {2/6}"
  termux-fastboot erase system
}

flash_product() {
  echo "-> Flashing product image... {3/6}"
  termux-fastboot flash product storage/downloads/product.img
}

flash_system() {
  echo "-> Flashing system image... {4/6}"
  termux-fastboot flash system storage/downloads/system.img
}

reboot_recovery() {
  echo "-> Rebooting into Recovery... {5/6}"
  termux-fastboot reboot recovery
}

reboot_recovery_adb() {
  echo "-> Rebooting into Recovery... {/}"
  termux-adb reboot recovery
}

reboot_bootloader_adb() {
  echo "-> Rebooting into bootloader mode... {6/6}"
  termux-adb reboot bootloader
}

reboot_download_adb() {
  echo "-> Rebooting inot download mode... {/}"
  termux-adb reboot download
}

erase_product() {
  echo "->erasing product... {/}"
  termux-fastboot erase product
}

format() {
  echo "->formatting... {/}"
  termux-fastboot -w
}

checking_adb() {
  echo "->checking ADB Devices... {/}"
  termux-adb devices
}

reboot_download_fastboot() {
  echo "->rebooting into download... {/}"
  termux-fastboot reboot download
}

reboot_bootloader_fastboot() {
  echo "rebooting into bootloader... {/}"
  termux-fastboot reboot bootloader
}

#mitools() {
#  echo "running mitools"
#  mitool
#}

flash_recovery() {
  echo "Flashing Recovery..."
  termux-fastboot flash recovery storage/downloads/recovery.img
}

flash_boot() {
  echo "Flashing Boot..."
  termux-fastboot flash boot storage/downloads/boot.img
}

flash_init_boot() {
  echo "Flashing init_boot..."
  termux-fastboot flash init_boot storage/downloads/init_boot.img
}

flash_vendor_boot() {
  echo "Flashing vendor_boot..."
  termux-fastboot flash vendor_boot storage/downloads/vendor_boot.img
}

flash_vbmeta() {
  echo "Flashing vbmeta..."
  termux-fastboot flash vbmeta storage/downloads/vbmeta.img
}

flash_vbmeta_system() {
  echo "Flashing vbmeta_system..."
  termux-fastboot flash vbmeta_system storage/downloads/vbmeta_system.img
}

flash_vbmeta_disabled() {
  echo "Flashing vbmeta disabled..."
  termux-fastboot --disable-verity --disable-verification flash vbmeta storage/downloads/vbmeta.img
}

flash_vbmeta_system_disabled() {
  echo "Flashing vbmeta_system disabled"
  termux-fastboot --disable-verity --disable-verification flash vbmeta_system storage/downloads/vbmeta_system.img
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

unlock_bl_1() {
echo "Trying to unlock bootloader..."
termux-fastboot flashing unlock
}

unlock_bl_2() {
echo "Trying to unlock bootloader..."
termux-fastboot oem unlock
}

menu() {
  echo ""
  echo "Select a step to execute : "
  echo ""
  echo -e "${BLUE} 0) Check adb devices"
  echo " 1) Reboot to fastboot (ADB)"
  echo -e "${GREEN} 2) Erase system"
  echo " 3) Flash product [Download/product.img]"
  echo " 4) Flash system  [Download/system.img]"
  echo " 5) Reboot to Recovery   (Fastboot)"
  echo " 6) Reboot to Bootloader (Fastboot)"
  echo " 7) Reboot to Download   (Fastboot)"
  echo -e "${BLUE} 8) Reboot to Recovery   (ADB)"
  echo " 9) Reboot to Bootloader (ADB)"
  echo "10) Reboot to Download   (ADB)"
  echo -e "${GREEN}11) Erase product        (Fastboot)"
  echo "12) Format               (Fastboot -w)"
  echo -e "${CYAN}13) Run all steps in sequence (1 → 5)"
  echo -e "${GREEN}14) Flash recovery              [Download/recovery.img]"
  echo "15) Flash boot                  [Download/boot.img]"
  echo "16) Flash init_boot             [Download/init_boot.img]"
  echo "17) Flash vendor_boot           [Download/vendor_boot.img]"
  echo "18) Flash vbmeta                [Download/vbmeta.img]"
  echo "19) Flash vbmeta_system         [Download/vbmeta_system.img]"
  echo "20) Flash vbmeta disabled       [Download/vbmeta.img]"
  echo "21) Flash vbmeta_system disabled[Download/vbmeta_system.img]"
  echo "22) Unlock Bootloader (Method 1)"
  echo "23) Unlock Bootloader (Method 2)"
  echo -e "${CYAN} q)  Quit"
  echo -e "${RESET}"
  read -p "Your choice: " choice
}

# Cat loop Meow (the most powerfule loop)
while true; do
  main_head
  menu
  case "$choice" in
    0) checking_adb ;;
    1) reboot_fastboot ;;
    2) erase_system ;;
    3) flash_product ;;
    4) flash_system ;;
    5) reboot_recovery ;;
    6) reboot_bootloader_fastboot ;;
    7) reboot_download_fastboot ;;
    8) reboot_recovery_adb ;;
    9) reboot_bootloader_adb ;;
    10) reboot_download_adb ;;
    11) erase_product ;;
    12) format;;
    13) Run_all_steps_in_sequence ;;
    14) flash_recovery ;;
    15) flash_boot ;;
    16) flash_init_boot ;;
    17) flash_vendor_boot ;;
    18) flash_vbmeta ;;
    19) flash_vbmeta_system ;;
    20) flash_vbmeta_disabled ;;
    21) flash_vbmeta_system_disabled ;;
    22) unlock_bl_1
    23) unlock_bl_2
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