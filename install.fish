#!/usr/bin/env fish

set -l REPO (realpath (dirname (status filename)))
set -l HOME_DIR $HOME

echo "==> Restoring isolated Ryoku configuration..."

function copy_tree
    set src $argv[1]
    set dst $argv[2]

    if not test -e "$src"
        return
    end

    mkdir -p "$dst"
    cp -r "$src/." "$dst/"
    echo "  [OK] $dst"
end

# ─────────────────────────────────────────────
# Ryoku configuration
# ─────────────────────────────────────────────

copy_tree "$REPO/config/ryoku" \
          "$HOME_DIR/.config/ryoku"

# ─────────────────────────────────────────────
# Quickshell
# ─────────────────────────────────────────────

copy_tree "$REPO/config/quickshell/shell" \
          "$HOME_DIR/.config/quickshell/shell"

# ─────────────────────────────────────────────
# Fish
# ─────────────────────────────────────────────

copy_tree "$REPO/config/fish" \
          "$HOME_DIR/.config/fish"

# ─────────────────────────────────────────────
# Hyprland
# ─────────────────────────────────────────────

copy_tree "$REPO/config/hypr" \
          "$HOME_DIR/.config/hypr"

# ─────────────────────────────────────────────
# Themes / applications
# ─────────────────────────────────────────────

copy_tree "$REPO/config/btop" \
          "$HOME_DIR/.config/btop"

copy_tree "$REPO/config/qt5ct" \
          "$HOME_DIR/.config/qt5ct"

copy_tree "$REPO/config/qt6ct" \
          "$HOME_DIR/.config/qt6ct"

copy_tree "$REPO/config/Kvantum" \
          "$HOME_DIR/.config/Kvantum"

copy_tree "$REPO/config/tmux" \
          "$HOME_DIR/.config/tmux"

copy_tree "$REPO/config/ryogami-wall" \
          "$HOME_DIR/.config/ryogami-wall"

# ─────────────────────────────────────────────
# User systemd services
# ─────────────────────────────────────────────

copy_tree "$REPO/config/systemd/user" \
          "$HOME_DIR/.config/systemd/user"

# ─────────────────────────────────────────────
# Ryoku command wrapper
# ─────────────────────────────────────────────

mkdir -p "$HOME_DIR/.local/bin"

if test -f "$REPO/config/local-bin/ryoku"
    cp "$REPO/config/local-bin/ryoku" \
       "$HOME_DIR/.local/bin/ryoku"

    chmod +x "$HOME_DIR/.local/bin/ryoku"

    echo "  [OK] ~/.local/bin/ryoku"
end

# ─────────────────────────────────────────────
# Reload
# ─────────────────────────────────────────────

echo
echo "==> Reloading systemd user units..."
systemctl --user daemon-reload

echo
echo "==> Restarting Ryoku shell..."

systemctl --user restart ryoku-shell.service 2>/dev/null

echo
echo "==> Done."
echo "Reboot recommended."
