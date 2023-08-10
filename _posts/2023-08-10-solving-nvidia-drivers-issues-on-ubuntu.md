---
layout: post
title:  "Solving nVidia Drivers Issues on Ubuntu"
tags:
  - drivers
  - nvidia
  - ubuntu
  - linux
---

I decided to give Ubuntu another try. While this wasn't my first experience with Linux distros, I was well aware that things might not always work as expected, especially with nVidia graphics cards. However, the last distro I used on a home laptop was [Pop!_OS by System76](https://pop.system76.com/), and I have to be honest... my experience with that OS and nVidia drivers was flawless, just as they promised. But let's set that aside for now; I might revisit Pop!_OS in the future.

To provide some context, I purchased a Lenovo Legion laptop with an nVidia RTX 2060 mobile GPU a couple of years ago. It came with a Windows 10 license (later upgraded to Windows 11) out of the box. Despite being unable in the past to fully transition away from Windows due to work or personal (gaming) reasons, I've always enjoyed working with Linux. So, I decided to set up a dual boot on this laptop. There are numerous distros to choose from, including the aforementioned Pop!_OS, but this time I opted to go back to the Ubuntu LTS desktop distro. At the time of writing, version 22.04 is the most recent LTS version.

After the initial (smooth, as always) installation and enabling of nVidia drivers through the "Software and Updates" app, my second HDMI monitor wasn't being detected. A quick Google search for "Ubuntu second monitor not working with nVidia GPU" confirmed that many Ubuntu community members still experience various issues when using Ubuntu with nVidia GPUs. Trying some of the suggested solutions, such as running `sudo ubuntu-drivers autoinstall` and purging all nVidia-related packages, followed by a couple of reboots, proved futile. In fact, one of these actions caused the UI to malfunction to the point where icons were barely visible. I had to enter recovery mode and reinstall some base components just to go back to the starting point.

So, what finally worked in my case, and what I'm sharing here for future reference and to potentially assist those facing similar issues, were the following steps:

1. Open a terminal and execute `lsmod | grep nouveau`. You should see output lines indicating that the system is using the nouveau drivers. Running the same command but replacing `nouveau` with `nvidia` should result in either no output or, in some cases (as it did for me once), one or two lines of output.
2. Go to "Software and Updates", then to "Additional Drivers". You'll find a list of nVidia drivers to choose from. As of the time of writing, the most recent driver version is 535, so I selected the option `Using NVIDIA driver metapackage from nvidia-driver-534 (proprietary, tested)`.
3. Select the desired driver and click "Apply Changes". The installation process takes a few minutes. You'll be prompted to enable Secure Boot to use third-party proprietary drivers and asked for a password. Enter your chosen password and proceed. Make sure to securely store the password, as you'll need it again.
4. When the installation is complete, you'll be asked to reboot. Before doing so, open a terminal and run the following commands to blacklist the nouveau drivers, preventing them from being loaded again:
```bash
sudo bash -c "echo blacklist nouveau > /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
sudo bash -c "echo options nouveau modeset=0 >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
sudo update-initramfs -u
```

Finally, reboot the machine. This time you'll be prompted with some options regarding MKO. Select the "Enroll MOK" option and input the chosen password. In subsequent boots, you should not see this prompt again. This step is essential to load the nVidia drivers while not disabling Secure Boot, which is needed for Windows 11.

When the Ubuntu OS starts again, there might be some initial flickering, but you should have your dual monitor setup working fine. Likely this will work for more than two monitors, but I cannot promise you that. You can also open the nVidia settings app and confirm that you now have a lot of settings that can help you tweak your GPU configuration.

And that's it! If you have a similar setup and encounter similar issues, following these steps should help resolve them. However, as they say, the devil is in the details, and your situation might differ. In that case, I recommend seeking help in the [nVidia forums](https://forums.developer.nvidia.com/). You might find someone with the same problem or get assistance by sharing system logs for nVidia experts to analyze.

In case you want to know more about, please refer to the following links:
- [Nouveau - FreeDesktop.org](https://nouveau.freedesktop.org/) - Official project page for Nouveau, an open source driver for nVidia cards.
- [UEFI/SecureBoot - Ubuntu Wiki](https://wiki.ubuntu.com/UEFI/SecureBoot) - This wiki page has all the details you need to know about MOK (Machine-Owner Key) and SecureBoot.

See you in the next post!