#!/bin/sh
if [ "z" == "z$USERNAME" ]
then
		# No user - use norma git tf
		exec /opt/git-tf-2.0.3.20131219/git-tf $@
fi

# Create expect script (we may want interaction)
cat > /setup/git-tf.exp <<EOF 
#!/usr/bin/expect
spawn /opt/git-tf-2.0.3.20131219/git-tf $@
expect "Username:"		
send "\$env(USERNAME)\n"
expect "Password:"
send "\$env(PASSWORD)\n"
interact
EOF

# execute
chmod +x /setup/git-tf.exp
exec /setup/git-tf.exp
