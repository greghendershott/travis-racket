# Starting with Racket 7.4, there is also a "CS" flavor.
for VER in 7.5 7.4 ; do
    for MIN in 0 1; do
        for NAT in 0 1; do
            for CS in 0 1; do
                TEST=1 RACKET_MINIMAL=$MIN RACKET_NATIPKG=$NAT RACKET_CS=$CS RACKET_VERSION=$VER ./install-racket.sh
            done
        done
    done
done

# Starting with Racket 6.5, there is also a "NATIPKG" flavor.
for VER in 7.3 7.2 7.1 7.0 6.12 6.11 6.10 6.9 6.8 6.7 6.6 6.5 ; do
    for MIN in 0 1; do
        for NAT in 0 1; do
            TEST=1 RACKET_MINIMAL=$MIN RACKET_NATIPKG=$NAT RACKET_VERSION=$VER ./install-racket.sh
        done
    done
done

# In older Racket versions, there is a "MINIMAL" "flavor".
for VER in HEAD HEADCS RELEASE RELEASECS 6.4 6.3 6.2 6.2.1 6.1 6.1.1 6.0 6.0.1 5.93 5.92 5.3 5.3.6 5.3.5 5.3.4 5.3.3 5.3.2 5.3.1 ; do
    for MIN in 0 1; do
        TEST=1 RACKET_MINIMAL=$MIN RACKET_VERSION=$VER ./install-racket.sh
    done
done
