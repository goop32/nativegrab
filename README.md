# nativegrab
PowerShell script that saves Native Access 2 plugins, packs, etc.

## What does it do?
As the short description suggests, this is a PowerShell script that will copy any files downloaded by Native Access. This is handy in case you'd like a local copy, or possibly for other purposes? (I don't judge)

## How does it work?
In short, it kills the NTKDaemon process (the process that handles downloading, installing, extracting, etc.) before it removes the install file, copies that file from the Public Downloads folder to $USERPROFILE\native\out, and tells you you're done. And yes, you do need to own the plugins and stuff first. Read more about NTKDaemon [here](https://community.native-instruments.com/discussion/8806/dev-talks-why-we-transformed-native-access/p1), last paragraph of History of Native Access.

## How do I use this?
Windows users only: open a PowerShell/Terminal prompt as administrator and plug it in there. You may need to mess with your script execution settings. Tested working on Windows 11 and NA2 v3.7.0. Please submit a bug report if it doesn't work on your system and be descriptive. I made this in ~2 hours on a Tuesday night while on a Discord call.

## Why?
You know how more and more companies seem to have this thing where you buy something but you never truly own it? That's not right. If you paid money for something, you should be able to do what you want with it. Break it, learn what it does, ~~crack it~~ register it with another useless Electron application.
