#/bin/bash

BASHRC_FILE="$HOME/.bashrc"

echo "Installing MPD and related packages..."
omarchy-pkg-add mpd mpc rmpc

mkdir -p ~/.config/mpd

cat > ~/.config/mpd/mpd.conf << 'EOF'
music_directory "~/Music/"
playlist_directory "~/.config/mpd/playlists"
db_file "~/.config/mpd/db"
log_file "~/.config/mpd/mpd.log"
pid_file "~/.config/mpd/mpd.pid"
state_file "~/.config/mpd/mpdstate"

#bind_to_address "localhost"
#port "6666"

audio_output {
type "pulse"
name "My MPD PulseAudio Output"
}

audio_output {
       type	"fifo"
       name	"Visualizer feed"
       path	"/tmp/mpd.fifo"
       format	"44100:16:2"
}
EOF

echo "Copying default Radio playlists..."
cp -r playlists ~/.config/mpd/


echo "Enabling and starting MPD service..."
systemctl --user enable mpd && systemctl --user start mpd


echo "Installing MPD MPRIS plugin..."
omarcy-pkg-add mpd-mpris

echo "Enabling and starting MPD MPRIS service..."
systemctl --user enable mpd-mpris.service && systemctl --user start mpd-mpris.service


echo "Replacing spotify Hypr keybinding to rmpc .."
sed -i 's|bindd = SUPER SHIFT, M, Music, exec, omarchy-launch-or-focus spotify|bindd = SUPER SHIFT, M, Music, exec, \$terminal -e rmpc|g' ~/.config/hypr/bindings.conf


ALIAS_LINE="alias m='rmpc'"

if ! grep -q "^alias m=" "$BASHRC_FILE"; then
  echo "Add alias m='rmpc' to .bashrc"
  echo "alias m='rmpc'" >> "$BASHRC_FILE"
fi




