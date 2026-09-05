# Isolated Ryoku Pretty Minimal I guess LMAO

Personal snapshot of my customized Ryoku desktop configuration.

This project is a small personal modification of the original [Ryoku](https://github.com/neur0map/ryoku-arch) project. The goal is not to replace Ryoku completely, but to keep the original Ryoku experience while applying my own preferred configuration, appearance, and workflow changes.

I customized this setup according to my own taste, mainly focusing on a cleaner and more minimal desktop, a simplified bar, a smoother wallpaper picker, and other small UI/workflow adjustments.

## Why this repository exists

I am a **distro hopper**. I frequently try different Linux distributions, reinstall systems, change desktop environments, and rebuild my setup while experimenting.

That makes a personal backup extremely useful. Instead of rebuilding my preferred Ryoku environment from scratch after every reinstall, I can:

1. Install a fresh Linux system.
2. Install Ryoku.
3. Clone this repository.
4. Run the restore script.
5. Reboot and continue using my preferred setup.

This repository is therefore primarily a **personal configuration backup and restore point**, not an official Ryoku distribution, fork, or replacement.

## Based on

This setup is based on the original Ryoku project by neur0map:

- Original project: https://github.com/neur0map/ryoku-arch

Please refer to the original project for Ryoku's own installation, architecture, packages, and documentation. This repository only contains my personal layer on top of it.

## What is included

The snapshot contains configuration and customization files such as:

- Ryoku configuration
- Custom Quickshell configuration
- Customized Ryoku bar
- Customized wallpaper picker
- Hyprland Ryoku scripts
- Fish configuration
- Qt5/Qt6 configuration
- Kvantum theme
- btop theme
- tmux colors
- Ryogami wallpaper configuration
- User systemd units
- Local `ryoku` wrapper used to keep Ryoku updates locked
- `RYOKU-VERSION.txt` with the Ryoku versions used when this snapshot was created
- `packages.txt` as a reference for packages used by this setup

## Ryoku update feature

The original Ryoku update feature has been intentionally **removed/disabled from my customized setup**.

I do not want the Ryoku environment to display update prompts or perform the normal Ryoku update flow. My goal is to keep the installed Ryoku version stable and reproducible rather than automatically moving to newer Ryoku builds.

This is implemented in two parts:

1. A local `ryoku` wrapper is installed at `~/.local/bin/ryoku`. The wrapper blocks the normal `ryoku update` command instead of allowing the update flow to run.
2. A pacman configuration reference is provided in `patches/pacman/ryoku-ignorepkg.conf` with `IgnorePkg = ryoku-*`, so the Arch package manager can keep Ryoku packages excluded from normal system upgrades.

The normal system package manager is still available. My intended workflow is to update the rest of the system manually with `sudo pacman -Syu` while keeping Ryoku itself locked.

This is a personal preference for this configuration and is **not a modification to the original Ryoku project**.

## What is intentionally excluded

The repository intentionally does **not** contain sensitive or temporary data, including:

- credentials
- keyring data
- API tokens
- caches
- wallpaper thumbnails
- temporary files
- old backups
- machine-specific runtime data that should not be shared

## Ryoku version

This configuration was captured against the versions recorded in [`RYOKU-VERSION.txt`](RYOKU-VERSION.txt).

The snapshot was made for my personal installation, so compatibility with a different Ryoku version is not guaranteed.

I intentionally keep Ryoku updates locked on my system. The repository therefore preserves the configuration around the Ryoku version I was using rather than assuming that the latest Ryoku release should always be used.

## Requirements

Before running the restore script, make sure the target system has:

- A working Linux installation with a user session
- Ryoku already installed
- Fish shell
- Git
- `systemd --user` available for user services
- The packages referenced by [`packages.txt`](packages.txt), when they are not already provided by the Ryoku installation

The restore script is a **configuration restore script**. It does not perform a full operating-system installation and it does not replace the official Ryoku installer.

## Installation / restore process

The intended workflow after a reinstall is:

### 1. Install the base system

Install your Linux distribution normally and make sure your graphical session, network, user account, and package manager are working.

This repository was created around my personal CachyOS/Ryoku workflow, but the configuration may work elsewhere if the required paths and packages exist.

### 2. Install Ryoku

Install the original Ryoku project first:

https://github.com/neur0map/ryoku-arch

For the closest match to this snapshot, check [`RYOKU-VERSION.txt`](RYOKU-VERSION.txt) and use a compatible Ryoku version.

### 3. Make sure the required tools exist

At minimum:

```fish
sudo pacman -S git fish
```

If your installation does not already provide the packages used by this configuration, consult `packages.txt` and install the missing ones.

The current package reference is:

```text
gpu-screen-recorder
hyprland
quickshell
ryoku-desktop
wf-recorder
```

### 4. Clone this repository

Using HTTPS:

```fish
git clone https://github.com/ilhamfirmansyahhub/isolated-ryoku-pretty-minimal.git
cd isolated-ryoku-pretty-minimal
```

Or using SSH:

```fish
git clone git@github.com:ilhamfirmansyahhub/isolated-ryoku-pretty-minimal.git
cd isolated-ryoku-pretty-minimal
```

### 5. Review the restore script

Before applying anything, it is recommended to read `install.fish`:

```fish
cat install.fish
```

The script copies the repository's configuration trees into the corresponding paths under `~/.config/` and restores the local `ryoku` wrapper into `~/.local/bin/ryoku`.

It does **not** intentionally copy credentials, caches, wallpaper thumbnails, or the excluded runtime files.

### 6. Run the restore script

Because the script is written for Fish, run:

```fish
chmod +x install.fish
./install.fish
```

Or explicitly:

```fish
fish install.fish
```

The script will:

- restore `~/.config/ryoku`
- restore the selected custom Quickshell files
- restore Fish, Hyprland, Qt, Kvantum, btop, tmux, and Ryogami configuration
- restore user systemd units
- restore the local `ryoku` wrapper
- reload the user systemd manager
- attempt to restart `ryoku-shell.service`

### 7. Restore the pacman update lock

The repository contains `patches/pacman/ryoku-ignorepkg.conf` as the reference for the pacman rule used by this setup:

```text
IgnorePkg = ryoku-*
```

Apply that rule to `/etc/pacman.conf` on a new installation if you want the same Ryoku update-lock behavior.

The exact system-level pacman configuration is kept as a separate patch/reference rather than replacing the entire `/etc/pacman.conf`, because that file is machine-specific.

### 8. Reboot

A reboot is recommended after the restore so the graphical session starts cleanly with the restored configuration.

## Important compatibility notes

This repository is a **personal dotfiles/configuration snapshot**, not a universal installer.

Some files can depend on:

- the installed Ryoku version
- the installed package versions
- Hyprland/Quickshell behavior
- filesystem paths
- hardware and GPU setup
- display names and monitor layout
- user services
- personal wallpaper locations
- personal preferences

For that reason, do not blindly copy the repository to an unrelated machine without reviewing the files first.

If something breaks after a future Ryoku update, first compare the installed Ryoku version with `RYOKU-VERSION.txt` and inspect the custom files before assuming the base Ryoku installation is broken.

## Restoring on a completely fresh machine

A practical distro-hopping restore sequence is:

```text
Fresh Linux installation
        ↓
Install required drivers / base packages
        ↓
Install Ryoku
        ↓
Clone this repository
        ↓
Review install.fish
        ↓
Run install.fish
        ↓
Restore pacman IgnorePkg rule
        ↓
Reboot
        ↓
Ryoku + my personal customizations restored
```

This keeps the responsibilities separated:

- **Ryoku upstream** provides the operating environment and original desktop.
- **This repository** provides my personal modifications and preferences.
- **The Linux distribution** provides the base system and hardware support.

## Keeping the backup up to date

When I make a configuration change that I want to keep:

```fish
cd ~/isolated-ryoku-pretty-minimal
git status
git add -A
git commit -m "Update Ryoku configuration"
git push
```

This turns the repository into a running history of my preferred setup instead of a single static backup.

## For future recovery

The most important files to understand are:

- `install.fish` — restore procedure
- `RYOKU-VERSION.txt` — Ryoku version reference
- `packages.txt` — package reference
- `config/` — personal configuration files
- `config/local-bin/ryoku` — local Ryoku update-lock wrapper
- `patches/pacman/ryoku-ignorepkg.conf` — pacman `IgnorePkg` reference used to lock Ryoku updates

Reading those files should make the repository understandable even after a long period away from it.

## Personal note

This repository exists because I enjoy experimenting with Linux and changing distributions. As a distro hopper, I would rather spend my time trying a new system than rebuilding the same desktop configuration manually every time.

So this is my personal **Ryoku restore point**: a small layer of customization built on top of the original Ryoku project, preserved so that I can easily recreate the environment I like after the next reinstall.
