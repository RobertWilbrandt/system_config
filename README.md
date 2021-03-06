# system_config
Initial system configuration setup

## Managing Users and Hostname

You can set the hostname by using

```console
sudo hostnamectl set-hostname <hostname>
```

In order to add a user, use

```console
sudo adduser <username> # Important: don't confuse this with useradd
```

You can add a new user to a group (e.g. ```sudo```) by using

```console
sudo usermod <username> -aG <group>
```

If you want to change your password later, use

```console
passwd # Beware: running this with sudo will change the root password, not yours
```

## Install i3 window manager

To install the i3 window manager with the default status bar and the dmenu_run launcher use

```console
sudo apt install i3-wm i3status suckless-tools
```

## Keyboard layout

In order to store the keyboard layout consistently, edit/add the following lines to ```/etc/default/keyboard```:

```console
XKBLAYOUT="de"
XKBVARIANT="neo"
```

## Locale setup

First, check if all required locales are generated by looking at the output of ```locale -a```. If a required one is missing, generate it by using the command ```sudo dpkg-reconfigure locales```. Afterwards, set your intended locales in the ```/etc/default/locale``` file. You can use the ```locale``` command to check your current configuration. This might look like

```console
LANG="en_US.UTF-8"
LC_CTYPE="de_DE.UTF-8"
LC_NUMERIC="de_DE.UTF-8"
LC_TIME="de_DE.UTF-8"
LC_COLLATE="de_DE.UTF-8"
LC_MONETARY="de_DE.UTF-8"
LC_MESSAGES="en_US.UTF-8" # This is used by e.g. man and apt to pick text language
LC_PAPER="de_DE.UTF-8"
LC_NAME="de_DE.UTF-8"
LC_ADDRESS="de_DE.UTF-8"
LC_TELEPHONE="de_DE.UTF-8"
LC_MEASUREMENT="de_DE.UTF-8"
LC_IDENTIFICATION="de_DE.UTF-8"
```

## Setup zsh as default shell

You first need to install zsh, and then use the ```chsh``` command to set it as default:

```console
sudo apt install zsh
chsh -s /usr/bin/zsh
```

## Disable CPU frequency scaling

In some applications you might want to disable cpu frequency scaling to avoid changes in performance. The procedure to do this is described on [the Franka Emika troubleshooting page](https://frankaemika.github.io/docs/troubleshooting.html). The required steps are:

```console
sudo apt install cpufrequtils
sudo systemctl disable ondemand
sudo systemctl enable cpufrequtils
sudo sh -c 'echo "GOVERNOR=performance" > /etc/default/cpufrequtils'
sudo systemctl deamon-reload
sudo systemctl restart cpufrequtils
```

You can check the result using the ```cpufreq-info``` command, the "current policy" section should list the current governor for each CPU as "performance".

## Install the config files from this repo

After installing some needed packages, you can just pull this repository and use the supplied install script.

```console
sudo apt install git stow python-pip python3-pip vim cmake libxml2-utils
git clone git@github.com:RobertWilbrandt/system_config.git
cd system_config
./install.sh
```
