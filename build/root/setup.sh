FILE=/config/wallet.key
if [ ! -f "$FILE" ]; then
    helium-wallet -f $FILE create basic $HELIUM_WALLET_PASSWORD
fi

# add scripts to systemd
systemctl start oracle.timer
systemctl enable oracle.timer