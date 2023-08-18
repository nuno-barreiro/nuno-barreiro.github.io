---
layout: post
title:  "Show Audio Selector in Ubuntu System Tray"
tags:
  - extensions
  - nvidia
  - ubuntu
  - linux
---

Something that really bothered me after installing Ubuntu 22.04 is the lack of an out-of-the-box audio selector in the system tray. I have a couple of input and output devices that I need to constantly switch, and having to open the Settings application and go to Audio settings every time is not a great user experience.

To solve this issue, I discovered a very useful [**"Sound Input & Output Device Chooser"**](https://extensions.gnome.org/extension/906/sound-output-device-chooser/) Gnome extension that provides a quick way to switch back and forth between available audio devices. In this post, I'll show you how to install this extension with just a couple of simple steps.

First, open a terminal to update APT repositories and install the necessary Gnome shell packages.

```bash
sudo apt update
sudo apt upgrade
sudo apt install gnome-shell-extensions gnome-shell-extension-manager
```

Once the installation is complete, install the Gnome Shell Integration browser extension. This extension makes your life easier by allowing you to enable extensions directly from the [Gnome Shell Extensions](https://extensions.gnome.org/) webpage with a single click. It also indicates which extensions are compatible with your system on the gnome extension details page. While there are other ways to install Gnome extensions, the browser integration offers a simple and straightforward method.

Here are the direct links to the Chrome and Firefox extension web page. 
- [Gnome Shell Integration for Chrome](https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep)
- [Gnome Shell Integration for Firefox](https://addons.mozilla.org/en-US/firefox/addon/gnome-shell-integration/)

Now, navigate to the [extension webpage](https://extensions.gnome.org/extension/906/sound-output-device-chooser/) and you'll find a toggle switch above its description. Clicking on it will prompt you to confirm the installation of the extension. Once done, you'll notice that the toggle is now in the "ON" state, and there's an additional button you can click to open the extension settings window. 

![Details of the Sound Input & Output Device Chooser Gnome extension, on the Gnome Extensions web page](/images/gnome-sound-chooser-extension-details.png)

Validate the installation by opening the tray and verifying that you now have available the input and output audio selectors.

![Ubuntu tray opened, showing input and output device selectors](/images/ubuntu-audio-selectors-tray.png)

You don't always have to visit the Gnome website to manage extensions. Alternatively, you can manage the built-in extensions, the ones you've installed, and enable, disable, or configure all of them using the "Extensions" application, which is now available in the Ubuntu apps screen.

The above steps were tested with the following Ubuntu and Gnome versions:
```bash
$ lsb_release -a
No LSB modules are available.
Distributor ID:	Ubuntu
Description:	Ubuntu 22.04.3 LTS
Release:	22.04
Codename:	jammy

$ gnome-shell --version
GNOME Shell 42.9
```

See you in the next post!