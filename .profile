# Add color variables
GREEN='\033[0;32m'   # Green
CYAN='\033[0;36m'    # Cyan
BLUE='\033[0;34m'    # Blue
PURPLE='\033[0;35m'  # Purple
NC='\033[0m'         # No Color (reset)

echo -e "${GREEN}Access Granted${NC}"

# Greetings function
greetings() {
    date "+%r"
    date "+%B %d, %Y"
    echo

    DAY=$(date "+%A")

    case $DAY in
        "Sunday") echo "It’s Sunday! Take it slow and enjoy the moment. 🌿🕊️" ;;
        "Monday") echo "New week, new goals. Let's crush it! 💪🚀" ;;
        "Tuesday") echo "Taco Tuesday vibes. Stay productive! 🌮💼" ;;
        "Wednesday") echo "It's Wednesday, my dudes! AAAAAHHH! 🙌🐪✨" ;;
        "Thursday") echo "One more day to go—let's finish strong! ⚡️💥" ;;
        "Friday") echo "Fri-yay! Time to wrap up the week and unwind. 🎉🍻" ;;
        "Saturday") echo "Saturday vibes! Time to relax and recharge! 🌅🛏️" ;;

    esac
}

greetings


sleep 1
echo -e "${PURPLE}Welcome Back,${NC} ${GREEN}$(whoami)!${NC}"

# FastFetch and Oh My Posh configuration
fastfetch
eval "$(oh-my-posh init bash --config ~/themes/peru.omp.json)"

# General Shortcuts
alias c='clear'                 # Clear the terminal screen
alias d='cd'                    # Change directory
alias la='ls -A'                # Show hidden files
alias ll='ls -alF'              # Detailed list with hidden files
alias home='cd ~'               # Go to home directory
alias docs='cd ~/Documents'     # Go to Documents directory
alias dl='cd ~/Downloads'       # Go to Downloads directory
alias desk='cd ~/Desktop'       # Go to Desktop directory
alias web='cd ~/www'            # Navigate to web server directory
alias op='sudo su'              # Open a root shell
alias ls='lsd'

# Networking
alias myip='curl ifconfig.me'   # Get your external IP address
alias pingg='ping google.com'   # Check connectivity to Google
alias ports='netstat -tulanp'   # List all open ports

# System Information
alias uptime='uptime -p'                   # Display uptime in a readable format
alias sysinfo='fastfetch'                   # Quick system info with FastFetch

# Disk Management
alias usage='df -h --total'                # Check disk space usage
alias diskfree='du -ah --max-depth=1 | sort -h'  # Show disk usage in current directory

# Editing Configuration Files
alias editrc='nano ~/.profile && source ~/.profile'  # Quick edit of .profile

# Navigation Shortcuts
function docs { cd "$HOME/Documents"; }

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
