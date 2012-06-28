# Dotfiles Builder

## Author
Sébastien Lavoie (github@lavoie.sl)

## Description
Compile several dotfiles using configurations and doing some tests only once.

For example:

  * Concatenate some paths in $PATH only if directory exists and is not already in $PATH
  * Add aliases using easy file structure with auto-escaping
  * Determine best locale based on available locales
  * Determine best $EDITOR/$VISUAL
  * etc.

The goal is to optimize `.bashrc` and other dotfiles to only include what works. 

Expensive checks can be done like looping through a lot of choices of even doing a `locate my-program`
because the `.bashrc` is compiled once, not everytime you start a new shell. 

## Howto
Right now, it is not very usable, but running [skeleton.sh](https://github.com/lavoiesl/dotfiles-builder/blob/master/skeleton.sh) will output a basic `.bashrc`.

See [examples/.bashrc](https://github.com/lavoiesl/dotfiles-builder/blob/master/examples/.bashrc).

If you modify your installation of your settings, re-run the build script

## Todo

  * Add config files
    * Editor preferences
    * Name, email, etc.
    * $PS1
    * Multiplexer
  * Better multi-platform support
  * Replace dependency to `bash` with `sh`
  * Remove dependency to `ruby` for `realpath`
  * Investigate more common practices for dotfiles
  * Add support for more dotfiles
  * Add commands to `skeleton.sh`: `install`, `dump`, `validate`, etc.
  * Completing this todo
