# Workstation Repave

Building a happy MacOS workstation with all the things.

System Ruby, [Homebrew][homebrew], and [Homebrew Bundle][homebrew_bundle] do the heavy lifting. But there is some lightweight Ruby-based shell scripting as well

## Assumptions

- MacOS Catalina or later
- Internet is connected

# First

1. Have a clean MacOS
1. Run Terminal
1. Run the following the bootstrap

```shell script
sh -c "$(curl -fsSL https://raw.githubusercontent.com/infews/workstation_repave/main/bin/bootstrap)"
```
...and watch the prompts

4. Run `bin/repave` to finish

# What's Happening?

## Bootstrap

The `bin/bootstrap` script will do the following:
- Install XCode's command line tools, which includes git
- Make the `~/workspace` directory (for all your coding projects)
- Clone this repo into `~/workspace`
- Prompt you to run the follow-on script

## Repave

The `bin/repave` script runs the remaining tasks, relying heavily on [Homebrew][homebrew] to finish the automatable tasks.

# More on Customization

- Nearly everything is installed via [Homebrew][homebrew] and is listed in `assets/Brewfile` (for use with Homebrew Bundle)
- Homebrew installs [rcm][rcm] in order to manage the dotfiles
  - Dotfiles live in this repo in `assets` 
  - The `bootstrap` script symlinks `~/` to `assets`
  - The `repave` script connects rcm to `assets`
- To allow git to do what it wants in `.gitconfig`, we write a version that includes `assets/gitinclude`, and RCM ignores it.

# Known Manual Work

These items don't seem to be automate-able. So manually crank through them once the system is updated.

- Chrome
  - Make Chrome default browser
  - Add Chrome Profiles
- Dropbox login
- Google Drive login  
- Github desktop setup
- Login Items, so they start on startup
  - Slate 
  - Quicksilver
  - Flycut
  - Dropbox
- Licenses for:
  - Deckset 2- Rotating Desktop backgrounds
- Configure TimeMachine

[homebrew]: https://brew.sh/
[homebrew_bundle]: https://github.com/Homebrew/homebrew-bundle
[rcm]: https://github.com/thoughtbot/rcm
