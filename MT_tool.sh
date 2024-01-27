#!/bin/bash

# Function to check if a package is installed
check_package() {
    package="$1"
    if ! command -v "$package" &> /dev/null; then
        echo "$package is not installed. Installing..."
        pkg install "$package" -y
    fi
}

# Check if Git is installed
check_package git

# Check if ncurses-utils is installed
check_package ncurses-utils

# Define colors and formatting using tput
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
CYAN=$(tput setaf 6)
BOLD=$(tput bold)
RESET=$(tput sgr0)

# Define array of tool names and their GitHub repository URLs
tools=(
    "MTbanner - https://github.com/OwaisAmir/MTbanner.git"
    "MT_Logo - https://github.com/OwaisAmir/MT_Logo.git"
    "MaxPhisher - https://github.com/KasRoudra/MaxPhisher.git"
    "Vidphishing - https://github.com/KasRoudra/VidPhisher.git"
    "wifite - https://github.com/derv82/wifite2.git"
    "Seeker - https://github.com/thewhiteh4t/seeker.git"
    "zphisher - https://github.com/htr-tech/zphisher.git"
    "CamPhish - https://github.com/techchipnet/CamPhish.git"
    "AndroRAT - https://github.com/karma9874/AndroRAT.git"
    "Metasploit-termux - https://github.com/h4ck3r0/Metasploit-termux.git"
    "medusa - https://github.com/Ch0pin/medusa.git"
    "nmap - https://github.com/nmap/nmap.git"
    "metasploit-framework - https://github.com/rapid7/metasploit-framework.git"
    "sqlmap - https://github.com/sqlmapproject/sqlmap.git"
    "theHarvester - https://github.com/laramies/theHarvester.git"
    "weeman - https://github.com/evait-security/weeman.git"
    "Wifite2 - https://github.com/derv82/wifite2.git"
    "bettercap - https://github.com/bettercap/bettercap.git"
    "airgeddon - https://github.com/v1s1t0r1sh3r3/airgeddon.git"
    "fluxion - https://github.com/FluxionNetwork/fluxion.git"
    "RouterSploit - https://github.com/threat9/routersploit.git"
    "XAttacker - https://github.com/Moham3dRiahi/XAttacker.git"
    "Gloom-Framework - https://github.com/joshDelta/Gloom-Framework.git"
    "d-tect - https://github.com/shawarkhanethicalhacker/D-TECT.git"
    "Sherlock - https://github.com/sherlock-project/sherlock.git"
    "Hunner - https://github.com/b3-v3r/Hunner.git"
    "RED_HAWK - https://github.com/Tuhinshubhra/RED_HAWK.git"
    "fsociety - https://github.com/Manisso/fsociety.git"
    "KnockMail - https://github.com/4w4k3/KnockMail.git"
    "HiddenEye - https://github.com/DarkSecDevelopers/HiddenEye.git"
    "Pybelt - https://github.com/Ekultek/Pybelt.git"
    "EasY_HaCk - https://github.com/sabri-zaki/EasY_HaCk.git"
    "4wsectools - https://github.com/aryanrtm/4wsectools.git"
    "Osmedeus - https://github.com/j3ssie/Osmedeus.git"
    "BruteSploit - https://github.com/Screetsec/BruteSploit.git"
    "InstaInsane - https://github.com/thelinuxchoice/instainsane.git"
    "kali-linux-termux - https://github.com/LionSec/kali-linux-termux.git"
    "Trity - https://github.com/toxic-ig/Trity.git"
    "lazyaircrack - https://github.com/4shadoww/lazyaircrack.git"
    "Routersploit - https://github.com/reverse-shell/routersploit.git"
    "reconspider - https://github.com/bhavsec/reconspider.git"
    "beeLogger - https://github.com/4w4k3/BeeLogger.git"
    "Infoga - https://github.com/m4ll0k/Infoga.git"
    "recon-ng - https://github.com/lanmaster53/recon-ng.git"
    "fsociety - https://github.com/Manisso/fsociety.git"
    "creak - https://github.com/codekansas/creak.git"
    "gophish - https://github.com/gophish/gophish.git"
    # Add more tools here in the same format
)

# Function to display menu and download selected tool
display_menu() {
    clear
    echo "${CYAN}${BOLD}  __  __ _     _______          _ "
    echo " |  \/  | |   |__   __|        | |"
    echo " | \  / | |_     | | ___   ___ | |"
    echo " | |\/| | __|    | |/ _ \ / _ \| |"
    echo " | |  | | |_     | | (_) | (_) | |"
    echo " |_|  |_|\__|    |_|\___/ \___/|_|${RESET}"
    echo "${CYAN}Welcome to ${YELLOW}${BOLD}MT tool!${RESET}"
    echo "${CYAN}Select an option:${RESET}"
    echo "1) ${GREEN}${BOLD}Show installed tools${RESET}"
    echo "2) ${GREEN}${BOLD}Download a tool${RESET}"
    echo "3) ${GREEN}${BOLD}Uninstall a tool${RESET}"
    echo "a) ${GREEN}${BOLD}About${RESET}"
    echo "q) ${RED}${BOLD}Quit${RESET}"

    read -p "${CYAN}Enter your choice: ${RESET}" option

    case $option in
        1)
            show_installed_tools
            ;;
        2)
            download_tool
            ;;
        3)
            uninstall_tool
            ;;
        a)
            about
            ;;
        q)
            echo "${RED}${BOLD}Exiting MT tool...${RESET}"
            exit 0
            ;;
        *)
            echo "${RED}Invalid choice! Please enter a valid option.${RESET}"
            ;;
    esac
}

# Function to display installed tools
show_installed_tools() {
    clear
    echo "${CYAN}${BOLD}Installed tools:${RESET}"
    for tool in "${tools[@]}"; do
        if [ -d "${tool%% -*}" ]; then
            echo "${GREEN}- ${tool%% -*}${RESET}"
        fi
    done
    read -p "${CYAN}Press Enter to continue...${RESET}" dummy
}

# Function to download a tool
download_tool() {
    clear
    echo "${CYAN}Select a tool to download:${RESET}"

    # Loop through array and display tool names with index
    for ((i=0; i<${#tools[@]}; i++)); do
        echo "$i) ${tools[$i]%% -*}"  # Display only the tool name
    done

    read -p "${CYAN}Enter the number of the tool you want to download (or 'q' to go back): ${RESET}" choice

    # Check if choice is valid and download the selected tool
    if [[ "$choice" =~ ^[0-9]+$ && "$choice" -ge 0 && "$choice" -lt "${#tools[@]}" ]]; then
        selected_tool=${tools[$choice]%% -*}  # Extract only the tool name
        tool_url=$(echo "${tools[$choice]}" | cut -d' ' -f3)  # Extract the GitHub URL
        echo "${CYAN}Downloading $selected_tool...${RESET}"
        
        # Change directory to the home directory
        cd ~
        
        # Clone the tool's GitHub repository in the home directory
        git clone "$tool_url" "$selected_tool"
        
        echo "${GREEN}Downloaded $selected_tool successfully!${RESET}"
    elif [ "$choice" == "q" ]; then
        echo "${CYAN}Going back to main menu...${RESET}"
    else
        echo "${RED}Invalid choice! Please enter a valid number.${RESET}"
    fi
    read -p "${CYAN}Press Enter to continue...${RESET}" dummy
    open_youtube_channel
}

# Function to uninstall a tool
uninstall_tool() {
    clear
    echo "${CYAN}Select a tool to uninstall:${RESET}"

    # Loop through installed tools and display their names with index
    installed_tools=()
    for tool in "${tools[@]}"; do
        tool_name=${tool%% -*}  # Extract only the tool name
        if [ -d "$tool_name" ]; then
            installed_tools+=("$tool_name")
        fi
    done

    if [ ${#installed_tools[@]} -eq 0 ]; then
        echo "${RED}No installed tools found.${RESET}"
    else
        for ((i=0; i<${#installed_tools[@]}; i++)); do
            echo "$i) ${installed_tools[$i]}"
        done

        read -p "${CYAN}Enter the number of the tool you want to uninstall (or 'q' to go back): ${RESET}" choice

        # Check if choice is valid and uninstall the selected tool
        if [[ "$choice" =~ ^[0-9]+$ && "$choice" -ge 0 && "$choice" -lt "${#installed_tools[@]}" ]]; then
            selected_tool="${installed_tools[$choice]}"
            echo "${CYAN}Uninstalling $selected_tool...${RESET}"
            rm -rf "$selected_tool"
            echo "${GREEN}Uninstalled $selected_tool successfully!${RESET}"
        elif [ "$choice" == "q" ]; then
            echo "${CYAN}Going back to main menu...${RESET}"
        else
            echo "${RED}Invalid choice! Please enter a valid number.${RESET}"
        fi
    fi
    read -p "${CYAN}Press Enter to continue...${RESET}" dummy
    open_youtube_channel
}

# Function to display about information and open YouTube channel link
about() {
    clear
    echo "${CYAN}${BOLD}MT tool - created by MOwaisAamir${RESET}"

    echo "${BOLD}About:${RESET}"
    echo "This tool allows you to download and manage various tools."
    echo "${GREEN}For more tutorials and updates, visit our YouTube channel:${RESET}"
    read -p "${CYAN}Press Enter to continue...${RESET}" dummy
    open_youtube_channel
}

# Function to open YouTube channel link
open_youtube_channel() {
    echo "${CYAN}Redirecting you to the YouTube channel...${RESET}"
    xdg-open "https://youtube.com/@reset_your_minds?si=PGrBbGJmq1rqpJgA"
}

# Main loop to display menu and handle user input
while true; do
    display_menu
done
