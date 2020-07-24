# VIM Amazing

Configuration for the best Editor ever made, that makes it AMAZING.

### What is this repository for?

Used for distributing my VIM configuration around for developing in C, Rust, and Python.

![Terminal](/images/terminal.png)

### How do I get set up?

Download the .vimrc file and put it in the home directory, or clone the repo and create
a symbolic link.  (i.e. ~/.vimrc)

[VIM-Plug](https://github.com/junegunn/vim-plug) is used for Plugins, and is
[automatically](https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation) installed.
When you first enter VIM, it will attempt to bootstrap all Plugins.

The default install will use Airline with Powerline Fonts.  If Powerline Fonts are not available
either disable the use of them (i.e. let g:airline_powerline_fonts = 0), or switch over to Lightline
in the plugin list by changing the the commented entries.  

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
