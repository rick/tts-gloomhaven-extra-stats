#!/bin/sh
set -eu
here=$(cd "$(dirname "$0")" && pwd)

# Note: this is for Linux, the MacOS path is at:
#
# ~/Library/Tabletop Simulator/Saves/Saved Objects/GHE Extra Stats.*

for base in \
  "$HOME/.local/share/Tabletop Simulator" \
  "$HOME/.var/app/com.valvesoftware.Steam/.local/share/Tabletop Simulator" \
  "$HOME/.steam/steam/steamapps/compatdata/286160/pfx/drive_c/users/steamuser/Documents/My Games/Tabletop Simulator"
do
  if [ -d "$base/Saves" ]; then
    dest="$base/Saves/Saved Objects"
    mkdir -p "$dest"
    cp "$here/GHE Extra Stats.json" "$here/GHE Extra Stats.png" "$dest/"
    echo "Installed to: $dest"
    exit 0
  fi
done

echo "Could not find a Tabletop Simulator data folder. Copy the two 'GHE Extra Stats' files into your 'Saves/Saved Objects' folder manually." >&2
exit 1
