# omarchy-install-mpd

This script automates the installation and configuration of the
Music Player Daemon (MPD) and related tools in Omarchy.

## What it does

1. **Installs MPD Core Components:**
    * Installs `mpd`, the music player daemon itself.
    * Installs `mpc`, a simple command-line client for MPD.
    * Installs `[rmpc](https://mierak.github.io/rmpc/)`, a Rusty Tui client for MPD.

2. **Configures MPD:**
    * Creates a default configuration file at `~/.config/mpd/mpd.conf`.
    * Sets the music directory to `~/Music/`.
    * Sets up PulseAudio output.
    * Creates a FIFO output for visualizers at `/tmp/mpd.fifo`.

3. **Adds Radio Playlists:**
    * Copies a collection of predefined radio playlists to `~/.config/mpd/playlists`.

4. **Enables Services:**
    * Enables and starts the `mpd` service for the current user.

5. **Integrates with Media Players (MPRIS):**
    * Installs the `mpd-mpris` plugin, which allows MPD (and thus `rmpc`) to be controlled by media keys and appear in system media controls.
    * Enables and starts the `mpd-mpris` service.

6. **Creates a Convenient Alias:**
    * Adds the alias `m` for the `rmpc` client to your `.bashrc`.

7. Replaces Omarchhy Hypr Spotify bindings for MPD control with `rmpc`.
