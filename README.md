# joedynamite/dotfiles

My dotfiles.

## Usage

Run `rake dotfiles` from within this directory to set everything up.

You can also use `rake` to run individual components:

    rake dotfiles:clone   # Clone and symlink dependant repositories.
    rake dotfiles:link    # Symlink main dotfiles and other settings files.
    rake dotfiles:system  # Run Mac OS X default settings script.

## Assumptions

The above dotfiles tasks change settings or install packages to the following software so we assume you have them installed.

- Sublime Text 2 and `subl`
- MacVim and `mvim`
- Xcode 4
- iTerm 2

Not all of them need to be installed *before* you run the scripts, but some will overwrite some changes if you install them afterwards.

----
