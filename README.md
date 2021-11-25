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

# How to Customize for You

Yes, you _will_ want to customize this repo. 

- Fork this repo
- Update the Brewfile in `assets/Brewfile`
  - Nearly everything is installed via [Homebrew][homebrew]
  - Make this file your own with brew scripts and casks for what you want/need 
- Update/add any dotfiles in the `dotfiles` directory
  - Dotfiles live in this repo in `dotfiles`, **without** prepended dots per rcm convention
  - [rcm][rcm] is installed (via Homebrew) to manage the dotfiles
  - See `dotfiles/rcrc` for which files are excluded
- rcm and git
  - Customize the file `assets/gitinclude` for your info
  - There is a task to make `~/.gitconfig` but it includes the content from `assets/gitinclude` because of git issues
- `dotfiles/zshrc` has some reasonable defaults
  - `fzf`, Starship, and `chruby` are installed via Homebrew and referenced here  
- Add any other personal executable scripts to `bin`
  - `dotfiles/zshrc` adds `~/bin` to the `$PATH`
- Edit/add any task classes to `bin/repave`
  - Ruby classes in `lib/repave` do the work
  - Add new tasks as classes as desired

# Contributing

- Please make any tasks idempotnent. The `repave` script is meant to be run often.
- Please do not add any external dependencies. This is meant to be run on a fresh MacOS very simply.

[homebrew]: https://brew.sh/
[homebrew_bundle]: https://github.com/Homebrew/homebrew-bundle
[rcm]: https://github.com/thoughtbot/rcm
