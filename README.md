# Spring completion
Bash completion support for Ruby on Rails spring command.

The completion routines provide support for completing:

* spring commands (help binstub status stop rails rake rspec)
* rake targets (e.g.: db:migrate db:version assets:clean ...)
* rails sub-commands (console runner generate destroy)

## Requirements

  * bash_completion

## Installation

### Brew install (OSX)
```bash
brew tap homebrew/completions
brew install spring-completion
```

then add something like this to your ~/.bashrc

```bash
if [ -f `brew --prefix`/etc/bash_completion.d/spring.bash ]; then
    source `brew --prefix`/etc/bash_completion.d/spring.bash
fi
```

### Non-OSX

  1. Copy the `spring.bash` file to somewhere (e.g. ~/.spring.bash).
  2. Add the following line to your `.bashrc`:

        source ~/.spring.bash

Alternatively, on Debian systems, you can just copy the `spring.bash` file to `/etc/bash_completion.d/` directory.

## Basic Usage

Typical usage is to change into a rails application and get some work.

For example, using rails console is something like:

    $ cd rails_app
    $ spring <Tab><Tab>
    binstub  help     rails    rake     rspec    status   stop
    $ rails st<Tab><Tab>
    status stop


For more details, use it and have fun!

## TODO
- Remove rake completion functions and use rake-completion if installed
- Use rails-completion if installed

## Bugs and Feedback

If you discover any bugs or have some idea, feel free to create an issue on GitHub:

<https://github.com/jacaetevha/spring_bash_completion/issues>


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/jacaetevha/spring_bash_completion/trend.png)](https://bitdeli.com/free "Bitdeli Badge")
