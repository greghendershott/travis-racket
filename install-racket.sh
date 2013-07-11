set -e

URL="http://download.racket-lang.org/installers/$RACKET_VERSION/racket/racket-$RACKET_VERSION-bin-x86_64-linux-debian-squeeze.sh"
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
