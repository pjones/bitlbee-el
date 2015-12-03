# Bitlbee-el: A simple way to run bitlbee in Emacs

## Commentary

Start and stop bitlbee from within Emacs.

Assumes you have a `~/.bitlbee` directory where the `bitlbee.conf`
file lives, along with the account information XML files.  The
directory can be set using the `bitlbee-user-directory` variable, and
is created automatically if necessary.

You might also need to set the `bitlbee-executable` variable.

## Usage

    (require 'bitlbee)
    M-x bitlbee-start
