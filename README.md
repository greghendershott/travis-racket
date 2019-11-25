![Build Status](https://travis-ci.org/greghendershott/travis-racket.svg?branch=master)

Until/unless Travis CI gets built-in support for Racket, we can use
the `install:` section of `.travis.yml` to download and run the
installer for various versions and variants of Racket.

To use in your project, simply add the [example
`.travis.yml`](example/.travis.yml) to the root of your repo.

> **NOTE:** Use `example/.travis.yml` --- *not* the one in the root of
> this repo, which is intended to test this repo not your project.

You may need to make some small edits to the file, as explained in its
comments. Specifically:

- You may want to change the `RACKET_VERSION` values, depending on
  which versions of Racket you intend to support.

- You may need to change its `script:` section to suit your project.
