# Isolated Ryoku Pretty Minimal

Personal snapshot of my customized Ryoku desktop configuration.

This project is a small personal modification of the original [Ryoku](https://github.com/neur0map/ryoku-arch) project. The goal is not to replace or fork Ryoku completely, but to keep my own preferred configuration and visual changes on top of the original Ryoku experience.

I customized it according to my own taste, mainly focusing on a cleaner, more minimal setup and a few personal workflow and UI adjustments.

## Why this repository exists

I am a **distro hopper**. I frequently experiment with different Linux distributions, reinstall systems, and change my setup while trying new environments.

Because of that, I maintain this repository as a personal backup and restore point. Instead of rebuilding my preferred Ryoku environment from scratch after every reinstall, I can reinstall my base system, install Ryoku, clone this repository, and restore my personal configuration.

The repository is therefore primarily a **personal configuration backup**, not an official Ryoku distribution or replacement.

## Based on

This setup is based on the original Ryoku project by neur0map:

- Original project: https://github.com/neur0map/ryoku-arch

Ryoku itself should be installed separately before applying this configuration.

## What is included

- Ryoku configuration
- Custom Quickshell configuration
- Customized Ryoku bar
- Customized wallpaper picker
- Hyprland Ryoku scripts
- Fish configuration
- Qt theme configuration
- Kvantum theme
- btop theme
- tmux colors
- Ryogami wallpaper configuration
- User systemd units
- Ryoku update-lock wrapper
- Ryoku version reference used for this snapshot

## What is intentionally excluded

- credentials
- keyring data
- caches
- wallpaper thumbnails
- temporary files
- old backups
- machine-specific runtime data

## Ryoku version

The configuration was captured against the Ryoku versions recorded in `RYOKU-VERSION.txt`.

This repository is intended to preserve the setup I personally use, so compatibility with other Ryoku versions is not guaranteed.

## Installation

Clone the repository:

```fish
git clone https://github.com/ilhamfirmansyahhub/isolated-ryoku-pretty-minimal.git
cd isolated-ryoku-pretty-minimal
./install.fish
```

Then reboot.

## Important

This repository assumes Ryoku itself is already installed.

It restores my configuration on top of an existing Ryoku installation.

Because this is a personal distro-hopping backup, some parts of the configuration may be specific to my hardware, system layout, installed packages, or personal preferences.

Always review `install.fish` before running it on another machine.

## Personal note

This repository exists mainly for convenience: whenever I reinstall a distribution or move to another Linux setup, I want a reliable place to restore the Ryoku environment that I personally enjoy using.
