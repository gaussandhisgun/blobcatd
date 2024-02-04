all: 
	echo 'this is a bash script, you either `make install` or `make uninstall` it'
install:
	chmod a+x ./blobcatd
	su -c "cp './blobcatd' '/usr/bin/blobcatd'"
	cp -R "./config/blobcatd" "${HOME}/.config/blobcatd"
	if [ -d "${HOME}/.config/systemd" ]; then echo "systemd found"; cp -R "./blobcatd.service" "${HOME}/.config/systemd/user"; fi
	echo "you can edit ${HOME}/.config/systemd/user/blobcatd.service if you want to change the settings of the daemon"
	echo 'you can also start the daemon with `systemctl --user enable --now blobcatd`'
uninstall:
	su -c "rm '/usr/bin/blobcatd'"
	rm -rf "${HOME}/.config/blobcatd"
	if [ -d "${HOME}/.config/systemd" ]; then echo 'systemd found; you will need to run `systemctl --user disable blobcatd` and `systemctl --user daemon-reload` if you enabled the daemon'; rm "${HOME}/.config/systemd/user/blobcatd.service"; fi
