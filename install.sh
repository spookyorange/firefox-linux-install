#!/bin/bash

literal_name_of_installation_directory=".tarball-installations"
universal_path_for_installation_directory="$HOME/$literal_name_of_installation_directory"
firefox_installation_directory="$universal_path_for_installation_directory/firefox"
official_package_location="https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US"
tar_location="./hello.tar.bz2"
open_tar_application_data_location="firefox"

echo "Welcome to Firefox tarball installer, just chill and wait for the installation to complete!"

sleep 1

echo "Installing the latest package"
curl -L -o $tar_location $official_package_location

tar -xvjf $tar_location

echo "Installed and untarred successfully"

if [ ! -d $universal_path_for_installation_directory ]; then
  echo "Creating the $universal_path_for_installation_directory directory for installation"
  mkdir $universal_path_for_installation_directory
fi

mv $open_tar_application_data_location $firefox_installation_directory

echo "Firefox successfully moved to your safe place!"

rm $tar_location

if [ ! -d ~/.local/bin/ ]; then
  echo "~/.local/bin not found, creating it for you"
  mkdir ~/.local/bin/
fi

touch ~/.local/bin/firefox
chmod u+x ~/.local/bin/firefox
echo "#!/bin/bash
$firefox_installation_directory/firefox" >> ~/.local/bin/firefox

echo "Created executable for your \$PATH if you ever need"

touch ~/.local/share/applications/firefox.desktop
echo "
[Desktop Entry]
Name=Firefox
Keywords=web;browser;internet
Exec=$firefox_installation_directory/firefox %u
Icon=$firefox_installation_directory/browser/chrome/icons/default/default128.png
Terminal=false
Type=Application
MimeType=text/html;text/xml;application/xhtml+xml;application/vnd.mozilla.xul+xml;text/mml;x-scheme-handler/http;x-scheme-handler/https;
Categories=Network;WebBrowser;
Actions=new-window;new-private-window;profile-manager-window;
[Desktop Action new-window]
Name=Open a New Window
Exec=$firefox_installation_directory/firefox --new-window %u
[Desktop Action new-private-window]
Name=Open a New Private Window
Exec=$firefox_installation_directory/firefox --private-window %u
[Desktop Action profile-manager-window]
Name=Open the Profile Manager
Exec=$firefox_installation_directory/firefox --ProfileManager
" >> ~/.local/share/applications/firefox.desktop

echo "Created desktop entry successfully"

sleep 1

echo "Installation is successful"

sleep 1

echo "Done, and done, have fun!"

sleep 1

exit 0
