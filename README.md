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

4. Populate a file `~/.system_name` with the name you want for this computer 
5. Run `bin/repave` to finish

# What's Happening?

## `bin/bootstrap`

The `bin/bootstrap` script will do the following:
- Install XCode's command line tools, which includes git
- Make the `~/workspace` directory (for all your coding projects)
- Clone this repo into `~/workspace`
- Prompt you to run the follow-on script

## `bin/repave`

The `bin/repave` script runs the remaining tasks, relying heavily on [Homebrew][homebrew] to finish the automatable tasks.

# More on Customization

- Nearly everything is installed via [Homebrew][homebrew]
  - Update the Brewfile in `assets/Brewfile` 
- This uses [rcm][rcm] to manage the dotfiles
  - Dotfiles live in this repo in `assets`, without prepended dots per rcm convention 
  - See `assets/rcrc` for which files are excluded
- To allow git to do what it wants in `.gitconfig`, we write a version that includes `assets/gitinclude`, and RCM ignores it.
- Configuration files & dotfiles live in `assets`
- `bin` holds any executables
  - `assets/zshrc` adds `~/bin` to the `$PATH`
- Ruby classes in `lib/repave` do the work
  - Add new tasks as desired
  - `bin/repave` actually runs the tasks

# Known Manual Work

These items don't seem to be automate-able. So manually crank through them once the system is updated.

- Chrome
  - [ ] Make Chrome default browser
  - [ ] Add Chrome Profiles
- [ ] Dropbox login
- [ ] Google Drive login  
- GithHub
  - [ ] Desktop setup
  - [ ] Update local key
- Login Items, so they start on startup
  - [ ] Slate 
  - [ ] Quicksilver
  - [ ] Flycut
  - [ ] Dropbox
- Licenses for:
  - [ ] Deckset 2
  - [ ] Airbuddy 2
- [ ] Rotating Desktop backgrounds from Dropbox folder
- [ ] Configure TimeMachine

[homebrew]: https://brew.sh/
[homebrew_bundle]: https://github.com/Homebrew/homebrew-bundle
[rcm]: https://github.com/thoughtbot/rcm
