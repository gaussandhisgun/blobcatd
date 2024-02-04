# blobcatd

so once upon a time i got [hit with an idea](https://wetdry.world/@gravitos/111063551410060977), and now i finally implemented it

this is a daemon (made in bash) that posts blobcats into your notifications, with configurable delay and stuff

## features

- it posts blobcats!
- i made a systemd service for it
- i also used this as a reason to finally try doing makefiles, so there even is an automated installation method!
- blobfoxes, neocats and neofoxes included
- you can add your own stuff, too
- configurable delay between notifications

```
		blobcatd		- by gravitos


inspired in this post: https://wetdry.world/@gravitos/111063551410060977


version blobcatd 0.1


args:
	-h	this
	-c	choose your fighter- i mean, character. these are stored in ~/.config/blobcatd
	-v	get version
	-t	wait time between each notifications
		(Pause for NUMBER seconds.  SUFFIX may be 's' for seconds (the default), 'm' for minutes, 'h' for hours or 'd' for days. NUMBER need not be an integer. Given two or more arguments, pause for the amount of time specified by the sum of their values.) - man sleep
```

## installation

### preparation

you will need `notify-send` (on arch, provided by `libnotify`), `find` (on arch, `findutils`), `awk` (tested with `gawk`) and `shuf` (from `coreutils`). if you use arch,
```bash
pacman -S --needed libnotify findutils gawk coreutils
```
should get you there.

### installation

```bash
git clone https://github.com/gaussandhisgun/blobcatd.git
cd blobcatd
make install
```
optionally, `systemctl --user enable --now blobcatd`. `make` will actually tell you where its located so you can edit it if you need to change the params

### removal
```bash
systemctl --user disable blobcatd
cd wherever-you-cloned-blobcatd-to
make uninstall
```

## adding your own characters

go to `.config/blobcatd`. create a folder, name it after your character. put a bunch of images and a plaintext file called `strings` inside. now, start `blobcatd -c yourcharactername`. done

## credits

- [@lewdum](https://heckin.how/@lewdum) for making me come up with the idea
- [@esm](https://wetdry.world/@esm) for conveniently storing emojis on wetdry.world
- [@volpeon](https://is-a.wyvern.rip/@volpeon) for most of the emojis
- myself, [@gravitos](https://wetdry.world/@gravitos) for the blobcat with a laptop emoji and the code
- everyone who sent a PR into here, even if it was not merged

feel free to fork and/or contribute
