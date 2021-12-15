# Workstation Repave

Building a happy MacOS workstation with all the things.

System Ruby, [Homebrew][homebrew], and [Homebrew Bundle][homebrew_bundle] do the heavy lifting. But there is some lightweight Ruby-based shell scripting as well.

## Assumptions

- MacOS Catalina or later
- Internet is connected

# First

1. Have a clean install of MacOS
1. Run Terminal
1. Run the following to bootstrap

```shell script
sh -c "$(curl -fsSL https://raw.githubusercontent.com/infews/workstation_repave/main/bin/bootstrap)"
```
...and watch the prompts

4. Populate the file `~/.system_name` with the name you want for this computer 
5. Run `bin/repave` to finish (See customization below)

# What's Happening?

## `bin/bootstrap`

The `bin/bootstrap` script will do the following:
- Install XCode's command line tools, which includes `git`
- Make the `~/workspace` directory (for all your coding projects)
- Clone this repo into `~/workspace`
- Prompt you to run the follow-on script

## `bin/repave`

The `bin/repave` script runs the remaining tasks, relying heavily on [Homebrew][homebrew] to finish the automatable tasks.

# But _Really_, What's Happenning?

- The repo is cloned locally
- Anything that can be installed, will be in `assets/Brewfile`
- All the dotfiles in `dotfiles` are managed and symlinked with `rcm`
- Gitconfig is included (separately because git)
- Run other, personal tasks

# How to Customize for You

Yes, you _*will*_ want to customize this repo. 

- Fork this repo and customize
- Assets
  - Update `assets/Brewfile` for all your installable apps (Homebrew, casks, mac apps)
    - `assets/Brewfile` to be used always
  - Update `assets/gitinclude` for git aliases & id's
    - `.gitconfig` cannot be managed by `rcm`, so we build it at install time
- Dotfiles
  - Dotfiles live in `dotfiles`, **without** prepended dots per rcm convention
    - [rcm][rcm] is installed (via Homebrew) to manage the dotfiles
    - See `dotfiles/rcrc` for which files are excluded
  - Useful defaults based on how repave works live in `zshrc`
- Add any other personal executable scripts to `bin`
  - `dotfiles/zshrc` adds `~/bin` to the `$PATH`
- Make your own tasks
  - Add new Ruby classes in `lib/repave` to do work (see examples)
  - Edit/add any task classes to `bin/repave`

# FAQ

1. Why not just do this with shell scripts?
   - Because I can never debug shell scripts. So Ruby FTW.
2. Why not Ansible?
   - Ruby FTW. 

# Contributing

- Please make any tasks idempotnent. The `repave` script is meant to be run often.
- Please do not add any external dependencies. This is meant to be run on a fresh MacOS very simply.

[homebrew]: https://brew.sh/
[homebrew_bundle]: https://github.com/Homebrew/homebrew-bundle
[rcm]: https://github.com/thoughtbot/rcm
