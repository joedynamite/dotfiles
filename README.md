# joedynamite/dotfiles

My dotfiles.

## Usage

Run `rake dotfiles` from within this directory to set everything up.

You can also use `rake` to run individual components:

    rake dotfiles:clone   # Clone and symlink dependent repositories.
    rake dotfiles:link    # Symlink main dotfiles and other settings files.
    rake dotfiles:system  # Run Mac OS X settings script.

## Assumptions

The `rake dotfiles` tasks listed above will change settings and/or install packages to the following software, so the assumption is that you have them installed.

- Sublime Text 3 beta and the `subl` terminal command
- Xcode 4+
- iTerm 2

Not all of them need to be installed *before* you run the scripts, but some of these settings may be overwritten by defaults if you install the software afterwards.

----
