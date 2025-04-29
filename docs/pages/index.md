---
comments: true
---

# Intro
Setup for [config/dotfiles](https://dotfiles.github.io).<br/>
See [home dir]({{ repo_url_to("home") }}) for main content.

???- info "[stow](https://www.gnu.org/software/stow/) manages symlinks 🫶 to `git` repo - helps automate _"sync"_ and _"conflict resolution"_."
    [stow (GNU Stow)](https://www.gnu.org/software/stow/)

    SYNOPSIS:

        stow [OPTION ...] [-D|-S|-R] PACKAGE ...

    OPTIONS:

        -d DIR, --dir=DIR     Set stow dir to DIR (default is current dir)
        -t DIR, --target=DIR  Set target to DIR (default is parent of stow dir)

        -S, --stow            Stow the package names that follow this option
        -D, --delete          Unstow the package names that follow this option
        -R, --restow          Restow (like stow -D followed by stow -S)

        --ignore=REGEX        Ignore files ending in this Perl regex
        --defer=REGEX         Don't stow files beginning with this Perl regex
                              if the file is already stowed to another package
        --override=REGEX      Force stowing files beginning with this Perl regex
                              if the file is already stowed to another package
        --adopt               (Use with care!)  Import existing files into stow package
                              from target.  Please read docs before using.
        -p, --compat          Use legacy algorithm for unstowing

        -n, --no, --simulate  Do not actually make any filesystem changes
        -v, --verbose[=N]     Increase verbosity (levels are from 0 to 5;
                                -v or --verbose adds 1; --verbose=N sets level)
        -V, --version         Show stow version number
        -h, --help            Show this help

## TL;DR - Summary Version

??? abstract "all.sh commands"

    ```shell
    git clone git@github.com:lukmdo/dotfiles.git
    cd dotfiles

    xcode-select --install
    # install Xcode from AppStore, then
    sudo xcodebuild -license accept
    sudo xcodebuild -runFirstLaunch

    ## Brew
    brew install $(grep '^\w' macos/brew.txt | tr '\n' ' ')

    ## MacPorts
    sudo port selfupdate
    sudo port -N install $(\
      cat macos/macports.txt | egrep '^\w' | tr '\n' ' ' )

    ## Terminal
    open macos/CustomTerminalSettings.terminal
    defaults write com.apple.terminal "Default Window Settings" -string "CustomTerminalSettings"
    defaults write com.apple.Terminal "Startup Window Settings" -string "CustomTerminalSettings"

    ## MacOS defaults
    macos/set_defaults.sh

    ## Bash
    echo /opt/local/bin/bash | sudo tee -a /etc/shells
    chsh -s /opt/local/bin/bash
    stow -t ~ --restow home
    ~/env/scripts/update_bash_completion.sh
    ```

<!--
```sh
sudo mkdir -p /var/cache/man  # fix
sudo mandb --create  # index
```
-->


## Key Components

<!-- idea: add tree diagram ? -->

!!! warning "Best Run in Order"

    Note: "add-on" components can be skipped.

    1. [brew/macports](#brewmacports)
    2. add-on: [macOS](#add-on-macos-tools)
    3. add-on: [standalone tools](#add-on-standalone-tools)
        - [CLI's](addon/cli)
        - [Apps](addon/apps)
    5. [bash glue](#bash-glue)

### Brew/MacPorts

Install required dependencies.
```shell
xcode-select --install

# install Xcode from AppStore, then
sudo xcodebuild -license accept
sudo xcodebuild -runFirstLaunch
```

=== "brew"

    Install [brew latest pkg installer](https://github.com/Homebrew/brew/releases)

    Install packages from [macos/brew.txt]({{ repo_url_to("macos/brew.txt") }})
    ```shell
    brew install $(grep '^\w' macos/brew.txt | tr '\n' ' ')
    ```

=== "macports"

    Install [macports](https://www.macports.org/install.php) utility (adds `port` command).

    Finally, will install selected ports:

    - [macos/macports.txt]({{ repo_url_to("macos/macports.txt") }})
      - alternative: minimalistic [macos/macports.min.txt]({{ repo_url_to("macos/macports.min.txt") }})

    === "simulate"
        ```sh
        # see full command
        echo port -N install $(\
          cat ~/dotfiles/macos/macports.txt | egrep '^\w' | tr '\n' ' ' )

        # dry run `-y`
        port -y -N install $(\
          cat ~/dotfiles/macos/macports.txt | egrep '^\w' | tr '\n' ' ' )
        ```

    === "run"
        ```sh
        sudo port selfupdate
        sudo port -N install $(\
          cat ~/dotfiles/macos/macports.txt | egrep '^\w' | tr '\n' ' ' )
        ```

    === "verify"
        ```shell
        port echo requested
        port echo requested and installed
        ```
<!---
```
# specific to python virtualenvwrapper and requires stow to run
lsvirtualenv -b | head
echo $WORKON_HOME
ls -l $WORKON_HOME
```
-->

### add-on: MacOS tools

```shell
macos/set_defaults.sh
```
[source]({{ repo_url_to("macos/set_defaults.sh") }})

Setup Terminal

Load custom settings and set as default.
```shell
open dotfiles/macos/CustomTerminalSettings.terminal
defaults write com.apple.terminal "Default Window Settings" -string "CustomTerminalSettings"
defaults write com.apple.Terminal "Startup Window Settings" -string "CustomTerminalSettings"
```

Then:

- app shortcuts
- crontab (load) from .config/.crontab

### add-on: standalone tools

- [CLIs](addon/cli)
- [Apps](addon/apps)
- IDE

jetbrains [keymap]({{ repo_url_to("jetbrains.keymap.lukmdo.macOS.xml") }})

### Bash Glue

Allow custom shell and set as default.
```shell
echo /opt/local/bin/bash | sudo tee -a /etc/shells
chsh -s /opt/local/bin/bash
```

Main [.bash_profile]({{ repo_url_to("home/.bash_profile") }}) sources:

- [.bash_path]({{ repo_url_to("home/.bash_path") }})
- [.bashrc]({{ repo_url_to("home/.bashrc") }})
- [.bash_aliases]({{ repo_url_to("home/.bash_aliases") }})
- [.bash_prompt]({{ repo_url_to("home/.bash_prompt") }})
- [.bash_completion]({{ repo_url_to("home/.bash_completion") }})
- [.bash_functions.d]({{ repo_url_to("home/.bash_functions.d") }})

Hook [home]({{ repo_url_to("home") }}) dir items to `$HOME` ( all via symlinks 🫶 ) :

=== "simulate"
    ```sh
    # dry run `-n`, verbose `-v`
    stow -n -v -t ~ --restow home
    ```
=== "conflicts!?"
    given seeing errors like
    ```sh
    WARNING! unstowing home would cause conflicts:
      * existing target is neither a link nor a directory: FILENAME
      ...
    WARNING! stowing home would cause conflicts:
      * existing target is neither a link nor a directory: FILENAME
      ...
    All operations aborted.
    ```
    can run this
    ```sh
    function diffy(){
      diff -q ~/$1 ./home/$1 && rm ~/$1 || vimdiff ~/$1 ./home/$1;
    }

    diffy FILENAME
    ```
=== "run"
    ```sh
    stow -t ~ --restow home
    ```
=== "verify"
    ```
    ls -la $HOME | grep .bash

    lrwxr-xr-x  .bash_aliases -> dotfiles/home/.bash_aliases
    lrwxr-xr-x  .bash_completion -> dotfiles/home/.bash_completion
    lrwxr-xr-x  .bash_completion.d -> dotfiles/home/.bash_completion.d
    lrwxr-xr-x  .bash_functions.d -> dotfiles/home/.bash_functions.d
    lrwxr-xr-x  .bash_path -> dotfiles/home/.bash_path
    lrwxr-xr-x  .bash_profile -> dotfiles/home/.bash_profile
    lrwxr-xr-x  .bash_prompt -> dotfiles/home/.bash_prompt
    lrwxr-xr-x  .bashrc -> dotfiles/home/.bashrc
    ...
    ```

<!--
other ...
```
stow -n -v -t ~ --stow home
stow -n -v -t ~ --adopt home  # (1)!
```

    1. `--adopt` is handy for import: _$HOME_ to _dotfiles/home_
-->


!!! info "Optional/recommended: Update completion scripts"

    Update `home/.bash_completion.d/*.sh` shell completion scripts.
    === "run"
        ```shell
        ~/env/scripts/update_bash_completion.sh
        ```
    === "Example output"
        ```shell
        Updating:

	        home/.bash_completion.d/cheat.sh_update.sh ... ✅
	        home/.bash_completion.d/cht.sh_update.sh ... ✅
            home/.bash_completion.d/kubectl.sh_update.sh ... ✅
            ...

        Status: (dotfiles - git status)

            On branch master
            nothing to commit, working tree clean
        ```
