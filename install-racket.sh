RACKET_VERSION=5.3.5
RACKET_URL="http://download.racket-lang.org/installers/$VERSION/racket/racket-$VERSION-bin-x86_64-linux-f14.sh"
RACKET_INSTALLER="racket-$VERSION.sh"

echo "Downloading $RACKET_URL to $RACKET_INSTALLER..."
curl -o $RACKET_INSTALLER $RACKET_URL

if [[ ! -f $RACKET_INSTALLER ]]; then
	echo "Error downloading Racket $VERSION from $RACKET_URL"
	exit 1
fi

echo "Running Racket installer"
chmod u+rx "$RACKET_INSTALLER"
"$RACKET_INSTALLER" <<EOF
no
1

EOF

exit 0
