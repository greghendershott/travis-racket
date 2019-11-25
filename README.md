Until/unless Travis CI gets built-in support for Racket, we can use
the `install` section of `.travis.yml` to download and run the Racket
installer.

To add this capability to your project, simply add the
[example `.travis.yml`](https://github.com/greghendershott/travis-racket/blob/master/example/.travis.yml)
to your repo. You may need to change its `script` section's `raco
make` and `raco test` parts.

> **NOTE:** Use `example/.travis.yml` --- *not* the one in the root of this rrepo, which is intended to test this repo not your project.

Here's a "badge" showing the status for the `master` branch of this
repo:

[![Build Status](https://travis-ci.org/greghendershott/travis-racket.png?branch=master)](https://travis-ci.org/greghendershott/travis-racket)
