Blissful Bash: 
A Clean and Minimal Bash Configuration

This is a streamlined and efficient .bashrc configuration designed for users who want a clean, and functional Bash experience. It includes useful aliases, custom functions, and configurations for system information, Docker, networking, and more.

Features
Convenient Aliases: Shortcuts for common commands, including:

System Management: update, upgrade
Docker Shortcuts: dps, di, dockerclean
Networking Tools: myip, ports, fdns
File Management: ll, la, diskfree
Prompt Customization: The prompt is configured to show the username, hostname, and current directory in color. You can modify the colors or structure by editing the PS1 variable in the .bashrc.

Docker: If Docker is installed, the script will load autocompletions for Docker commands. You can also adjust Docker aliases as needed.

System Commands
c: Clear the terminal.
d: Change directory (cd).
la: List files, including hidden ones.
ll: Detailed listing of files with hidden files.
upgrade: Updates and upgrades the system using apt.
update: Alias for upgrade.

Networking
myip: Fetch your external IP address.
pingg: Ping Google to check connectivity.
ports: List all open ports.
fdns: Flush the DNS cache.

Docker
dockerclean: Prune unused Docker objects (volumes, images).
dc: Short for docker compose.
dps: List running Docker containers.
di: List Docker images.

System Information
uptime: Display system uptime in a user-friendly format.
sysinfo: Show detailed system information using fastfetch.
ect

Credits
FastFetch: For quick system information display.
Oh My Posh: For a beautiful shell theme (requires oh-my-posh installation).
License
This configuration is open-source and available for personal or educational use.
