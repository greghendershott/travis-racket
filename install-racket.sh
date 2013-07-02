set -e

# VERSION=5.3.5
URL="http://download.racket-lang.org/installers/$VERSION/racket/racket-$VERSION-bin-x86_64-linux-ubuntu-precise.sh"
INSTALL="./racket-$VERSION.sh"

echo "Downloading $URL to $INSTALL:"
curl -o $INSTALL $URL

echo "Running $INSTALL to install Racket:"
chmod u+rx "$INSTALL"
sudo "$INSTALL" <<EOF
no
1

EOF

exit 0
