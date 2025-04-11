# Blissful Bash: Clean and Minimal Bash Configurations for User and Root

Blissful Bash provides two lightweight, organized `.bashrc` setups—one for regular users and one for the root user. Each version is optimized for its environment, including helpful aliases, prompt enhancements, Docker tools, and system commands.

It’s designed for those who prefer a functional and efficient terminal experience with minimal clutter.

Features
--------
- Two Separate Configurations:
  - `user.bashrc` for daily usage with optional Oh My Posh and Zoxide support
  - `root.bashrc` with Starship prompt and elevated tool access

- Convenient Aliases:
  - System Management: update, upgrade
  - Docker Shortcuts: dps, di, dockerclean, dc
  - Networking Tools: myip, ports, fdns, pingg
  - File Management: ll, la, c

- Prompt Customization:
  - User: Clean PS1 with username, host, and path in color
  - Root: Styled Starship prompt for fast and readable command context

- Docker Integration:
  - Docker aliases for containers, images, and cleanup
  - Docker autocompletions enabled if installed

System Commands
---------------
- c: Clear the terminal
- d: Change directory (cd)
- la: List all files, including hidden ones
- ll: Long listing of all files
- upgrade: Update and upgrade the system using apt
- update: Alias for upgrade

Networking Commands
-------------------
- myip: Get your external IP address
- pingg: Ping Google to test internet
- ports: List all open ports (ss-based)
- fdns: Flush DNS cache

Docker Commands
---------------
- dockerclean: Remove unused Docker containers, images, and volumes
- dc: Alias for docker-compose
- dps: List running Docker containers
- di: List Docker images

System Information
------------------
- uptime: Show current system uptime
- sysinfo: Display system stats using FastFetch (if installed)

Installation
------------
Before using these configurations, install the following tools:

1. **Oh My Posh** (User only, optional):
   - Install using the instructions at: https://ohmyposh.dev/docs/
   - Configure your prompt if using this in `user.bashrc`.

2. **FastFetch**:
   - To install, run:
     ```bash
     git clone https://github.com/dylanaraps/fastfetch.git
     cd fastfetch
     make
     sudo make install
     ```
   - Or follow: https://github.com/dylanaraps/fastfetch

3. **Zoxide** (User only, optional):
   - A faster way to jump around directories:
     ```bash
     curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
     ```

4. **Nala** (Optional, better apt frontend):
   - Install with:
     ```bash
     sudo apt install nala
     ```

5. **Starship** (Root only):
   - Install with:
     ```bash
     curl -sS https://starship.rs/install.sh | sh
     ```

Usage
-----
Once dependencies are installed:

- Copy `user.bashrc` to `~/.bashrc`
- Copy `root.bashrc` to `/root/.bashrc`
- Restart your terminal or run:
  ```bash
  source ~/.bashrc
  sudo -i && source /root/.bashrc
