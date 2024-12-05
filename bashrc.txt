# ~/.bashrc: executed by bash(1) for non-login shells.
# See /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Add color variables
GREEN='\033[0;32m'        # Green
YELLOW='\033[1;33m'       # Yellow
BLUE='\033[0;34m'         # Blue
NC='\033[0m'              # No Color (reset)
RED='\033[0;31m'          # Red (for errors)

sleep 1
echo -e "${GREEN}🔹Access Granted🔹${NC}"

# FastFetch and Oh My Posh configuration
eval "$(oh-my-posh init bash --config ~/.cache/oh-my-posh/themes/sonicboom_dark.omp.json)"
eval "$(zoxide init bash)"

sleep 1
echo -e "${BLUE}🔹Welcome Back ${USER}🔹${NC}"

# General Shortcuts
alias c='clear'
alias d='cd'
alias la='ls -A'                # Show hidden files
alias ll='ls -alF'              # Detailed list with hidden files
alias home='cd ~'               # Go to home directory
alias docs='cd ~/docs'          # Go to Documents directory
alias dl='cd ~/downloads'       # Go to Downloads directory
alias desk='cd ~/desktop'       # Go to Desktop directory
alias web='cd ~/web'            # Navigate to web server directory
alias op='sudo su'              # Open a root shell
alias upgrade='nala update && nala upgrade -y' #updates and upgrades system with the nala package manager
alias update='nala update && nala upgrade -y'  #updates and upgrades system with the nala package manager

# Networking
alias myip='curl ifconfig.me'   # Get your external IP address
alias pingg='ping google.com'   # Check connectivity to Google
alias ports='netstat -tulanp'   # List all open ports
alias fdns='sudo systemd-resolve --flush-caches' # Clear DNS cache

# Package Management (using Nala)
alias apt-update='sudo apt update'         # Update package list
alias apt-upgrade='sudo apt upgrade -y --full-upgrade'   # Upgrade packages
alias apt-install='sudo apt install'       # Install a package
alias cleanup='sudo apt autoremove && sudo apt clean'  # Clean up unnecessary packages

# System Control
alias sysreboot='sudo systemctl reboot'   # Reboot the system

# Docker Shortcuts
alias dockerclean='docker volume prune -f && docker image prune -f'  # Clean up unused Docker objects
alias dc='docker compose'                  # Shorter command for docker-compose
alias dps='docker ps'                      # Show running containers
alias di='docker images'                   # List Docker images

# System Information
alias uptime='uptime -p'                   # Display uptime in a readable format
alias sysinfo='fastfetch'                  # Quick system info with FastFetch

# Disk Management
alias usage='df -h --total'                # Check disk space usage
alias diskfree='du -ah --max-depth=1 | sort -h'  # Show disk usage in current directory

# Editing Configuration Files
alias editrc='nano ~/.bashrc && source ~/.bashrc && echo -e "${YELLOW}Successfully reloaded .bashrc!${NC}"'  # Quick edit of .bashrc

# Function to replace apt-get with apt, even when using sudo
apt-get() {
    # Check if the command is being called with sudo
    if [[ "$EUID" -eq 0 ]]; then
        echo "Intercepted (sudo): $1"
    else
        echo "Intercepted: $1"
    fi

    # Determine which apt-get command is being run
    case "$1" in
        update)
            echo "Running: sudo apt update"
            sudo apt update || echo -e "${RED}Nala update failed.${NC}"
            ;;
        upgrade)
            echo "Running: sudo apt upgrade -y"
            sudo apt upgrade -y || echo -e "${RED}Nala upgrade failed.${NC}"
            ;;
        install|remove|autoremove)
            echo "Running: sudo apt $1 ${@:2}"
            sudo apt "$1" "${@:2}" || echo -e "${RED}Nala $1 failed.${NC}"
            ;;
        *)
            echo "Running original apt-get command"
            command apt-get "$@" || echo -e "${RED}Original apt-get command failed.${NC}"
            ;;
    esac
}

# Optional: Simplified sudo function
sudo() {
    command sudo "$@"
}

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return ;;
esac

# History settings
HISTCONTROL=ignoreboth
HISTIGNORE="ls:clear:exit"
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

# Check window size after each command
shopt -s checkwinsize

# Enable globstar for recursive file searching
shopt -s globstar

# Customize the prompt (without showing git branch)
if [ -n "$force_color_prompt" ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Enable color support for ls and alias definitions
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias l='ls -CF'  # Additional ls options
fi

# Auto-completion for Docker if available
if [ -f /usr/share/bash-completion/completions/docker ]; then
    . /usr/share/bash-completion/completions/docker
fi
