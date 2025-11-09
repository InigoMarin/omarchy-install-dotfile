# Omarchy Install Extra

Collection of installation scripts to enhance your Omarchy setup with additional tools and configurations.

## Installation Scripts

### omarchy-install-all.sh

Main installation script that runs all individual installers sequentially.

**What it does:**
1. Installs Fish shell and configures the environment
2. Installs MPD (Music Player Daemon) and related tools

**Usage:**
```bash
./omarchy-install-all.sh
```

---

### omarchy-install-fish.sh

Automates the installation and configuration of Fish shell and modern CLI tools.

**What it does:**

1. **Installs Fish Shell:**
    * Installs `fish` shell
    * Adds fish to `/etc/shells`
    * Sets fish as the default shell for the current user

2. **Installs Modern CLI Tools:**
    * Installs `zoxide` - smarter cd command
    * Installs `starship` - customizable prompt
    * Installs `eza` - modern replacement for ls

3. **Configures Fish:**
    * Initializes zoxide in fish
    * Initializes starship prompt
    * Creates `ls` abbreviation to expand to `eza`
    * Installs the `m` function for rmpc
    * Installs and configures Tokyo Night theme via fisher

**Usage:**
```bash
./omarchy-install-fish.sh
```

---

### omarchy-install-mpd.sh

Automates the installation and configuration of the Music Player Daemon (MPD) and related tools.

**What it does:**

1. **Installs MPD Core Components:**
    * Installs `mpd` - the music player daemon itself
    * Installs `mpc` - a simple command-line client for MPD
    * Installs [rmpc](https://mierak.github.io/rmpc/) - a Rusty Tui client for MPD

2. **Configures MPD:**
    * Creates a default configuration file at `~/.config/mpd/mpd.conf`
    * Sets the music directory to `~/Music/`
    * Sets up PulseAudio output
    * Creates a FIFO output for visualizers at `/tmp/mpd.fifo`

3. **Adds Radio Playlists:**
    * Copies a collection of predefined radio playlists to `~/.config/mpd/playlists`

4. **Enables Services:**
    * Enables and starts the `mpd` service for the current user

5. **Integrates with Media Players (MPRIS):**
    * Installs the `mpd-mpris` plugin
    * Allows MPD to be controlled by media keys and appear in system media controls
    * Enables and starts the `mpd-mpris` service

6. **Creates a Convenient Function:**
    * Adds the `m` function for the `rmpc` client

7. **Updates Hyprland Configuration:**
    * Replaces Omarchy Hypr Spotify bindings for MPD control with `rmpc`

**Usage:**
```bash
./omarchy-install-mpd.sh
```

---

## Requirements

* Omarchy Linux distribution
* `omarchy-pkg-add` command available
* sudo privileges for some operations
