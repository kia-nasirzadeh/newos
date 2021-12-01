## 1- get services and save them into a file

## 2- setup the git and github

clone this repo and replace new services files with old one

## 3- install wsl

## 3- setup terminal

a terminal json file can set everything you want, just replace it with default json settings file

now set profiles:

for powershell: `C:\Users\kia-nasirzadeh\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1`

for ubuntu: `/home/<user-name>/.bashrc`

## 4- active builtin administrator account

`net user administrator /active:yes`

## 5- to active prompt color in sudo -s, go to /root and in there vim .bashrc: then:
```
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\033[41m💀💀💀💀💀💀💀💀💀💀💀💀💀💀💀💀💀💀💀\033[30m\u@\h:\[\033[00m\]\w\[\033[00m\]\$ '
fi
```
