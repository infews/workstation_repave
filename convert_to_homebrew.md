# Port this project to Homebrew

## Simple Ruby 

What is the order of operations that lets Homebrew run as early as possible?

  - ✔ `bootstrap` (simple Ruby one-line-script that does:)
    - Tasks:
        - Install XCode
        - make ~/workspace
        - clone the repo
        - Writes ~/.system_name
    - Needs to be a one-liner that is easy to copy from GitHub
    - Instructions need to be in the readme
  - ✔ `set_system_name`
    - Tasks
        - Fails if no .system_name is present
        - takes name and runs commands
  - ✔ `prep_homebrew`
    - Tasks
      - Sets HOMEBREW FILE ENV variable to clone this repo
      - runs 
    

## Personal Cask and Formula

- Can we write each of these actors as cask formulae:
  1. macos_defaults
  1. RCM config
  1.  Quicksilver/Yosemite
  1. pivotal intellij bindings
    - needs to handle relative includes better to work within Homebrew download
  
These would be in the Brewfile, along with a tap to the keg  
  
  
