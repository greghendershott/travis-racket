VERSION=5.3.5
URL="http://download.racket-lang.org/installers/$VERSION/racket/racket-$VERSION-bin-x86_64-linux-f14.sh"
INSTALL="racket-$VERSION.sh"

echo "Downloading $URL to $INSTALL..."
curl -o $INSTALL $URL

if [[ ! -f $INSTALL ]]; then
	echo "Error downloading Racket $VERSION from $URL"
	exit 1
fi

echo "Running Racket installer"
chmod u+rx "$INSTALL"
"$INSTALL" <<EOF
no
1

EOF

exit 0
