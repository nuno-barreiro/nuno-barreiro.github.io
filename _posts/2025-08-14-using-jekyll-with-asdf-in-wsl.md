---
layout: post
title:  "Using Jekyll with ASDF in WSL"
tags:
  - jekyll
  - asdf
  - wsl
  - ruby
---

Recently, I upgraded to a new laptop and had to reinstall my development environment from scratch—including Windows and WSL (Windows Subsystem for Linux). For my projects, I prefer using the Ubuntu distro on WSL, and I rely on [asdf](https://asdf-vm.com/) as my version manager for languages like Ruby.

After cloning the source for this website (which uses Jekyll as a static site generator), I assumed I could simply run `asdf install` since my repo already included a `.tool-versions` file. However, things didn’t go as smoothly as expected when I tried to install the required gems for Jekyll and Bundler.

Here’s the error I encountered:

```bash
➜ gem install jekyll bundler
<internal:/home/nbarreiro/.asdf/installs/ruby/3.1.2/lib/ruby/3.1.0/rubygems/core_ext/kernel_require.rb>:85:in `require': cannot load such file -- zlib (LoadError)
...
```

According to the [official Jekyll docs for Ubuntu](https://jekyllrb.com/docs/installation/ubuntu/), you need to install some prerequisites:

```bash
sudo apt-get install ruby-full build-essential zlib1g-dev
```

Since I use asdf to manage Ruby, I skipped the `ruby-full` package. I already had most of the required packages installed, but something was still missing.

After some research, I discovered that skipping `ruby-full` meant I needed to manually install a few additional dependencies. The following command covers those:

```bash
sudo apt update
sudo apt install libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev
```

With those installed, I reinstalled Ruby via asdf:

```bash
asdf uninstall ruby 3.1.2
asdf install ruby 3.1.2
```

And to confirm that zlib was available, I ran:

```bash
ruby -e "require 'zlib'; puts 'zlib is available'"
zlib is available
```

Success! I was then able to install Jekyll and Bundler without any issues:

```bash
➜ gem install jekyll bundler
Fetching pathutil-0.16.2.gem
Fetching rouge-4.6.0.gem
Fetching safe_yaml-1.0.5.gem
Fetching mercenary-0.4.0.gem
(...)
31 gems installed
```

Ready to start blogging again. Problem solved!
