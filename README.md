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

The default install will use [Airline](https://github.com/vim-airline/vim-airline) and
[DevIcons](https://github.com/ryanoasis/vim-devicons) so it's best to head over to
[Nerd Fonts](https://www.nerdfonts.com/font-downloads), and get your favourite font with
all the good stuff loaded in the terminal before using this VIM configuration.

### Auto Completion

To achieve auto completion [You Complete Me](https://github.com/ycm-core/YouCompleteMe) will
be installed, and the build will start automatically.

Python is automatically included, but you can see I have included
 * C/C++
 * Rust
 * TypeScript

You may prefer to adjust this, by removing the parameters supplied to the install.py script
in the VIM configuration.

```
./install.py --clangd-completer --rust-completer --ts-completer
```

### Contribution guidelines

My philosophy is to make usable or meaningful adjustments only.

* Keep it simple.
* Keep it simple.
* Keep it simple.

### Who do I talk to?

* Repo owner or admin
* Other community or team contact
