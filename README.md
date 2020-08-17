# Workstation Repave

Building a happy MacOS workstation with all the things.

System Ruby, [Homebrew][homebrew], and [Homebrew Bundle][homebrew_bundle] do the heavy lifting. But there is some lightweight Ruby-based shell scripting as well

## Assumptions

- MacOS Catalina or later
- Internet is connected

# First

1. Have a clean MacOS
1. Run Terminal
1. Run the following:

```shell script
sh -c "$(curl -fsSL https://raw.githubusercontent.com/infews/workstation_repave/master/bootstrap)"
```
...and watch the prompts

# What's Happening?

## Bootstrap

The `bootstrap` script will do the following:
- Install XCode's command line tools, which includes git
- Make the ~/workspace directory (for all your coding projects)
- Clone this repo
- Prompt you to run the follow-on script

## Repave

Once you have this repo locally, you can run the `./bin/repave` script to run the remainder 

# More on Customization

- Homebrew installs nearly everything. And since this uses Brew Bundle, you can get all the apps and Mac App Store apps (thanks, `mas`) installed. The Brewfile is symlinked from `~/` to `assets`.
- Thoughtbot's [rcm][rcm] manages your dotfiles, symlinking from `~/` to the `assets` directory. If you have an app that needs/wants a dotfile, add it here using RCM, just like the Brewfile.
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
  - VMWare Fusion  
- nvALT points to Dropbox directory
- Desktop backgrounds are different, point to Dropbox, and rotate every 30mins
- Configure TimeMachine
- MacOS dock position

[homebrew]: https://brew.sh/
[homebrew_bundle]: https://github.com/Homebrew/homebrew-bundle
[rcm]: https://github.com/thoughtbot/rcm
