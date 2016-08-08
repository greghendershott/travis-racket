#!/usr/bin/bash

for VER in 6.6 6.5 6.4 6.3 6.2 6.2.1 6.1 6.1.1 6.0 6.0.1 5.93 5.92 5.3 5.3.6 5.3.5 5.3.4 5.3.3 5.3.2 5.3.1 HEAD RELEASE SNAPSHOT_SCOPE ; do
    for MIN in 0 1; do
        TEST=1 RACKET_MINIMAL=$MIN RACKET_VERSION=$VER ./install-racket.sh
    done
done
