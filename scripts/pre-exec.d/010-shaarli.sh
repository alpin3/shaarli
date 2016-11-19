#!/bin/sh

APACHESHACONF=/etc/apache2/conf.d/shaarli.conf

if [ "$SUBURI" == "" ]; then
	echo "[i] Using default URI: /"
	SUBURI="/"
fi
echo "[i] Serving URI: $SUBURI"


if [ -f $APACHESHACONF ]; then
	echo "[i] SUBURI already configured!"
else
	echo "[i] Configuring URI: $SUBURI"
	cat <<EOF > $APACHESHACONF
<Directory /php>
    Options FollowSymLinks
    AllowOverride All
    Require all granted 
</Directory>

Alias $SUBURI "/php/"
EOF
fi
