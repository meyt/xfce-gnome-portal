# XFCE GNOME Portal Bridge

[![Build status](https://github.com/meyt/xfce-gnome-portal/actions/workflows/build.yml/badge.svg)](https://github.com/meyt/xfce-gnome-portal/actions)
![Platform](https://img.shields.io/badge/platform-Debian%20%7C%20Ubuntu%20%7C%20XFCE-blue)
![License](https://img.shields.io/badge/license-MIT-green)

This simple package allows XFCE sessions to seamlessly interact with GNOME-specific services and backends.

It will fix issues like using system-wide proxy settings in applications
(chrome, vscode, firefox, etc), web-rtc based screen-casting or using gnome file picker.

## Installation

Download the latest `.deb` from the
[Releases](https://github.com/meyt/xfce-gnome-portal/releases) page and install:

```bash
sudo apt install ./xfce-gnome-portal_v1_all.deb
```

> **Note:** A **reboot** or **logout/login** is required after installation
> for the global environment changes to take effect.

## Build from Source

1. **Clone the repo:**

```bash
git clone https://github.com/meyt/xfce-gnome-portal.git
cd xfce-gnome-portal
```

2. **Build the package:**

```bash
make
```

3. The package will be generated in `./build/xfce-gnome-portal.deb`.

## How it works

The package uses Debian `postinst` scripts to safely inject the GNOME identity
into `/etc/environment`.
It also places a configuration file in
`/usr/share/xdg-desktop-portal/xfce-portals.conf` which tells the portal system
to prefer the GNOME backend even when the session manager reports XFCE.
This dual-layer approach ensures that stubborn applications like Google Chrome
correctly identify the system state.
