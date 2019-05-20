# Homebrew Audio

[![Build Status](https://travis-ci.org/david0/homebrew-audio.svg?branch=master)](https://travis-ci.org/david0/homebrew-audio)


This tap contains audio tools and plugins that can not be added to main homebrew (no stable version tagged, no website etc)


## How do I install these formulae?

Just `brew tap david0/homebrew-audio` and then `brew install <formula>`.

## LV2 Plugin UIs

If you are using the official Ardour binary, Ardour will segfault if you try to use the GTK UI. This is because its not possible to mix two versions of GTK in the same memory space.  
Use the Generic UI only instead (see the [Ardour Manual](http://manual.ardour.org/working-with-plugins/working-with-ardour-built-plugin-editors/) for more information on that).

Try using the *experimental* (and not officially supported) [Ardour Formula](https://github.com/david0/homebrew-audio/blob/master/Formula/ardour4.rb), which will build an Ardour version using the GTK stack provided by homebrew.

Any other LV2 host that is build via homebrew like [jalv](https://github.com/david0/homebrew-audio/blob/master/Formula/jalv.rb) will also work fine with the GTK UIs.


## Contributing

Feel free to issue a PR adding additional formulae or improving the existing ones.

You can try to commit these formulae to main homebrew but be aware that usually each formula has some problems that make it not fulfill the minimum acceptable [formula criteria](https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Acceptable-Formulae.md) (mostly *head-only*)

## Ardour 5

I will try to install all the dependencies from https://nightly.ardour.org/list.php via home-brew with custom Formulae.

Already done:

1.- pkg-config 0.28.
2.- 
