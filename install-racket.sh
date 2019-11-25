#!/bin/bash
#
# In the Travis CI environment `#!/bin/bash` won't suffice (it's here
# to make shellcheck happy and for convenience when using this script
# locally).
#
# Instead .travis.yml should pipe this script to bash (not to sh).

set -e

if [[ "$RACKET_MINIMAL" = "1" ]]; then
    MIN="minimal-"
else
    MIN=""
fi

if [[ "$RACKET_NATIPKG" = "1" ]]; then
    RACKET_NATIPKG="-natipkg"
else
    RACKET_NATIPKG=""
fi

if [[ "$RACKET_CS" = "1" ]]; then
    RACKET_CS="-cs"
else
    RACKET_CS=""
fi

# If this section seems like a mess, it is, because reasons:
#
# - The download URL naming conventions have changed over the years.
#
# - The Linux version name has changed over the years.
#
# - From time to time a Racket download server has gone offline, in
#   which case this file has been "hot fixed". In the absence of any
#   clear resolution signal ("you can resume using the original
#   server"), the hot fix remains in place (until maybe someday it
#   needs to be hot fixed).
#
# On the one hand, it sucks. On the other hand, a large part of the
# "added value" of this repo that it deals with the suckage so that
# ordinary users need not. They can supply names for Racket versions
# and variants using a consistent naming scheme, and we'll try to make
# it work.

DL_BASE="https://www.cs.utah.edu/plt/installers"

if [[ "$RACKET_VERSION" = "HEAD" ]]; then
    NWU_BASE="https://plt.eecs.northwestern.edu/snapshots/current/installers"
    if [[ "$RACKET_MINIMAL" = "1" ]]; then
        URL="${NWU_BASE}/min-racket-current-x86_64-linux-precise.sh"
    else
        URL="${NWU_BASE}/racket-test-current-x86_64-linux-precise.sh"
    fi
elif [[ "$RACKET_VERSION" = "HEADCS" ]]; then
    UTAH_BASE="https://www.cs.utah.edu/plt/snapshots/current/installers"
    if [[ "$RACKET_MINIMAL" = "1" ]]; then
        URL="${UTAH_BASE}/min-racket-current-x86_64-linux-cs-xenial.sh"
    else
        URL="${UTAH_BASE}/racket-current-x86_64-linux-cs-xenial.sh"
    fi
elif [[ "$RACKET_VERSION" = 5.3* ]]; then
    if [[ "$RACKET_MINIMAL" = "1" ]]; then
        URL="${DL_BASE}/${RACKET_VERSION}/racket-textual/racket-textual-${RACKET_VERSION}-bin-x86_64-linux-debian-squeeze.sh"
    else
        URL="${DL_BASE}/${RACKET_VERSION}/racket/racket-${MIN}${RACKET_VERSION}-bin-x86_64-linux-debian-squeeze.sh"
    fi
elif [[ "$RACKET_VERSION" = "RELEASE" ]]; then
    URL="https://pre-release.racket-lang.org/installers/racket-${MIN}current-x86_64-linux${RACKET_NATIPKG}.sh"
elif [[ "$RACKET_VERSION" = "RELEASECS" ]]; then
    URL="https://pre-release.racket-lang.org/installers/racket-${MIN}current-x86_64-linux${RACKET_NATIPKG}-cs.sh"
elif [[ "$RACKET_VERSION" = 5.9* ]]; then
    URL="${DL_BASE}/${RACKET_VERSION}/racket-${MIN}${RACKET_VERSION}-x86_64-linux-ubuntu-quantal.sh"
elif [[ "$RACKET_VERSION" = 6.[0-4] ]] || [[ "$RACKET_VERSION" = 6.[0-4].[0-9] ]]; then
    URL="${DL_BASE}/${RACKET_VERSION}/racket-${MIN}${RACKET_VERSION}-x86_64-linux-ubuntu-precise.sh"
elif [[ "$RACKET_VERSION" = 6.* ]]; then
    URL="${DL_BASE}/${RACKET_VERSION}/racket-${MIN}${RACKET_VERSION}-x86_64-linux${RACKET_NATIPKG}.sh"
elif [[ "$RACKET_VERSION" = 7.* ]]; then
    URL="${DL_BASE}/${RACKET_VERSION}/racket-${MIN}${RACKET_VERSION}-x86_64-linux${RACKET_NATIPKG}${RACKET_CS}.sh"
else
    echo "ERROR: Unsupported version ${RACKET_VERSION}"
    exit 1
fi

printf "%-25s" "${MIN}${RACKET_VERSION}${RACKET_NATIPKG}${RACKET_CS}"
echo "@ ${URL}"
if  curl -I -L "$URL" 2>&1 | grep 404.Not.Found ; then
    echo "Installer not available"
    if [[ "$RACKET_VERSION" = "HEAD" ]]; then
        echo "Did the build fail? Check the logs at https://plt.eecs.northwestern.edu/snapshots/current/log/"
    fi
    exit 1
fi

if [ -n "$TEST" ]; then
    exit 0
fi

# Older .travis.yml files don't set $RACKET_DIR (the Racket install
# directory) explicitly and expect it to be /usr/racket.
if [[ "$RACKET_DIR" = "" ]]; then
    RACKET_DIR=/usr/racket
fi

INSTALLER="./racket-${MIN}${RACKET_VERSION}.sh"

echo "Downloading $URL to $INSTALLER:"
curl -L -o "$INSTALLER" "$URL"

echo "Making $INSTALLER executable:"
chmod u+rx "$INSTALLER"

# Only use sudo if installing to /usr
if [[ "$RACKET_DIR" = /usr* ]]; then
    RUN_INSTALLER="sudo ${INSTALLER}"
else
    RUN_INSTALLER="${INSTALLER}"
fi

echo "Running $RUN_INSTALLER to install Racket:"

$RUN_INSTALLER <<EOF
no
"$RACKET_DIR"

EOF

if [[ "$RACKET_MINIMAL" = "1" ]]; then
    echo "Minimal Racket: Installing packages for raco test..."
    ${RACKET_DIR}/bin/raco pkg install --auto --scope installation rackunit-lib compiler-lib
fi

exit 0
