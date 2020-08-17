# Workstation Repave

Building a happy MacOS workstation with all the things.

System Ruby, [Homebrew][homebrew], and [Homebrew Bundle][homebrew_bundle] do the heavy lifting. But there is some lightweight Ruby-based shell scripting as well

## Assumptions

- MacOS Catalina or later
- Internet is connected

# First run

1. Have a clean MacOS
1. Run Terminal
1. Run the following:

```shell script
sh -c "$(curl -fsSL https://raw.githubusercontent.com/infews/workstation_repave/master/bootstrap)"
```
1. Follow the prompts

# Subsequent Runs


# What's Happening?

## Bootstrap

The `bootstrap` script will do the following:
- Install XCode's command line tools, which includes git
- Make the ~/workspace directory (for all your coding projects)
- Clone this repo
- Prompt you to run the follow-on script

## Repave

Once you have this repo locally, you can run the `repave` script to run the remainder 

## Homebrew


## Special Instructions for MacOS Sierra

Since Sierra's system Ruby 2.0.0, there are some additional constraints

1. You need to install an older version of the Rainbow gem
    - `gem install rainbow --version 2.2.2 --user-install ` should work
1. Sierra's XCode command line tools v9.2
    - If you are a paying Apple Developer, Apple's download page has this version
    - Otherwise, find a `.pkg` of this version of the tools and run them early

# Ruby Development

There are actors and dotfiles included that use `ruby-install` to get a different Ruby version than system and use `chruby` to switch to that Ruby. Feel free to skip if you don't want a Ruby development environment.

# More on Customization

- Homebrew installs nearly everything. And since this uses Brew Bundle, you can get all the apps and Mac App Store apps (thanks, `mas`) installed. The Brewfile is symlinked from `~/` to `assets`.
- Thoughtbot's [rcm][rcm] manages your dotfiles, symlinking from `~/` to the `assets` directory. If you have an app that needs/wants a dotfile, add it here using RCM, just like the Brewfile.
- Speaking of dotfiles, `bash_profile` and `bashrc` - are very personal. Notice that `bash_profile` includes `bashrc`.
- To allow git to do what it wants in `.gitconfig`, we write a version that includes `assets/gitinclude`, and RCM ignores it.

# Known Manual Work

These items don't seem to be automate-able. So manually crank through them once the system is updated.

- Make Chrome default browser
- Add Chrome Profiles
- Dropbox Setup
- Github desktop
- Login apps:
  - Slate restart, slate on login
  - MacsFans on login
  - Quicksilver config, on login, network plugin
  - Flycut
  - Dropbox
- Licenses for:
  - Deckset 2
  - VMWare Fusion 8  
- nvALT points to Dropbox directory
- Desktop backgrounds are different, point to Dropbox, and rotate every 30mins
- Configure TimeMachine
- MacOS dock position

# TODO List

- Install script is clunky
- Enable multiple scripts (e.g., pre-apps, apps, ruby dev env)
- Are multiple brew files even possible?



[homebrew]: https://brew.sh/
[homebrew_bundle]: https://github.com/Homebrew/homebrew-bundle
[rcm]: https://github.com/thoughtbot/rcm
