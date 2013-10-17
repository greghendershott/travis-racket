set -e

if [ "$RACKET_VERSION" == "HEAD" ]; then
    # Unfortunately there is no abstract URL for "HEAD" -- the nighly
    # builds have a version number like 5.90.0.9 embedded in the
    # URL. So this will need to be updated manually whenever the
    # version is bumped.
    HEAD_VERSION="5.90.0.9"
    URL="http://www.cs.utah.edu/plt/snapshots/current/installers/racket-${HEAD_VERSION}-x86_64-linux-precise.sh"
else
    URL="http://download.racket-lang.org/installers/${RACKET_VERSION}/racket/racket-${RACKET_VERSION}-bin-x86_64-linux-debian-squeeze.sh"
fi

INSTALL="./racket-${RACKET_VERSION}.sh"

echo "Downloading $URL to $INSTALL:"
curl -o $INSTALL $URL

echo "Running $INSTALL to install Racket:"
chmod u+rx "$INSTALL"
sudo "$INSTALL" <<EOF
no
1

EOF

exit 0
