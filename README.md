# VIM Amazing

Configuration for the best Editor ever made, that makes it AMAZING.

### What is this repository for?

Used for distributing my VIM configuration around for developing in C, Rust, and Python.

![Terminal](/images/terminal.png)

### How do I get set up?

First make sure you are using a current full version of VIM, meaning not VIM-tiny or VI.

Download the .vimrc file and put it in the home directory, or clone the repo and create
a symbolic link.  (i.e. ~/.vimrc)

[VIM-Plug](https://github.com/junegunn/vim-plug) is used for Plugins, and is
[automatically](https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation) installed.
When you first enter VIM, it will attempt to bootstrap all Plugins.

The default install will use Airline, but you can find entries to switch over to Lightline
if prefered.  Powerline Fonts can be used with Airline to make the interface look similar
to the Terminal image above, by enabling them in the plugin section for Airline.

If you are on Ubuntu though, installing Powerline fonts is pretty basic.

```bash
sudo apt install fonts-powerline
```

### Contribution guidelines

My philosophy is to make usable or meaningful adjustments only.

* Keep it simple.
* Keep it simple.
* Keep it simple.

### Who do I talk to?

* Repo owner or admin
* Other community or team contact
