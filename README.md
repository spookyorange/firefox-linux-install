# Install tarball version of Firefox with just a basic script!

A script to easily install Firefox the tarball way on your Linux machine!

Learn how I scriptified it @ [my relevant Medium article](https://medium.com/@spookyorange/scriptifying-stuff-installation-for-tarball-of-mozilla-firefox-on-linux-4c10cd352265)

## Usage

Clone the repo and run the script
```bash

git clone https://github.com/spookyorange/firefox-linux-install.git
cd firefox-linux-install
sh ./install.sh

```

To remove the application(if it has been installed with this method)
```bash

sh ./uninstall.sh

```

## Details

The script will install the application in the following destinations if you have installed locally:

- ~/.tarball-installations/firefox
- ~/.local/bin/firefox
- ~/.local/share/applications/firefox.desktop

## Tested Distros

- Fedora by Spookyorange

## Contributing

If you have a distro that you would like to add to the list of tested distros, please submit a pull request with the changes you made to the script and the distro you tested it on.
