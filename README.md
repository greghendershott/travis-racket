# Deprecated

As of 2020-11-25 I no longer use Travis CI for my projects.

Instead I am using
[`setup-racket`](https://github.com/Bogdanp/setup-racket) with GitHub
Actions.

After maintaining this repo for eight years, I'm glad to pass the
baton.

If you're willing and able to pay Travis CI, you might still find this
repo useful. You can fork it. Someday, when there is a new version of
Racket, you might need to update the `install-racket.sh` script (as I
would have done, but won't be doing anymore).

I'm not going to "Archive" this repo -- which would make it read-only
for issues and pull-requests -- right away. So if you have any
questions, feel feee to open an issue. But eventually I probably
will archive it.

# Still want to use this? Here's the old README

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
