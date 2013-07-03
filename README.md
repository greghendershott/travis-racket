Experimenting with using Travis CI for a Racket project.

Until Travis CI gets built-in support for Racket, we can use the
`before_install` clause of `.travis.yml` to download and run the
Racket installer.

> **CAVEAT**: This downloads the ~75MB Racket installer and runs it
> for **each and every** build! In other words, this is a hack. The
> un-hack would be (IIUC) to add a Travis CI "cookbook" for Racket.

To add this capability to your project, simply add the
[example `.travis.yml`](https://github.com/greghendershott/travis-racket/blob/master/.travis.yml)
to your repo. You may need to change its `script` section's `raco
make` and `raco test` parts.

Here's a "badge" showing the status for the `master` branch of this
repo:

[![Build Status](https://travis-ci.org/greghendershott/travis-racket.png?branch=master)](https://travis-ci.org/greghendershott/travis-racket)
