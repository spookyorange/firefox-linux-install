#!/bin/bash

app_name=firefox
literal_name_of_installation_directory=".tarball-installations"
universal_path_for_installation_directory="$HOME/$literal_name_of_installation_directory"
app_installation_directory="$universal_path_for_installation_directory/firefox"
official_package_location="https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US"
tar_location="./hello.tar.bz2"
open_tar_application_data_location="firefox"
local_bin_path="$HOME/.local/bin"
local_application_path="$HOME/.local/share/applications"
app_bin_in_local_bin="$local_bin_path/$app_name"
desktop_in_local_applications="$local_application_path/$app_name.desktop"
icon_path="$app_installation_directory/browser/chrome/icons/default/default128.png"

echo "Welcome to Firefox tarball installer, just chill and wait for the installation to complete!"

sleep 1

echo "Checking to see if an older installation exists"
if [ -f $app_bin_in_local_bin ]; then
  echo "Old bin file detected, removing..."
  rm $app_bin_in_local_bin
fi

if [ -d $app_installation_directory ]; then
  echo "Old app files are found, removing..."
  rm -rf $app_installation_directory
fi

if [ -f $desktop_in_local_applications ]; then
  echo "Old app files are found, removing..."
  rm $desktop_in_local_applications
fi

sleep 1

echo "Installing the latest package"
curl -L -o $tar_location $official_package_location

tar -xvjf $tar_location

echo "Installed and untarred successfully"

if [ ! -d $universal_path_for_installation_directory ]; then
  echo "Creating the $universal_path_for_installation_directory directory for installation"
  mkdir $universal_path_for_installation_directory
fi

mv $open_tar_application_data_location $app_installation_directory

echo "Firefox successfully moved to your safe place!"

rm $tar_location

if [ ! -d $local_bin_path ]; then
  echo "$local_bin_path not found, creating it for you"
  mkdir $local_bin_path
fi

touch $app_bin_in_local_bin
chmod u+x $app_bin_in_local_bin
echo "#!/bin/bash
$app_installation_directory/firefox" >> $app_bin_in_local_bin

echo "Created executable for your \$PATH if you ever need"

touch $desktop_in_local_applications
echo "
[Desktop Entry]
Name=Firefox
Keywords=web;browser;internet
Exec=$app_installation_directory/firefox %u
Icon=$icon_path
Terminal=false
Type=Application
MimeType=text/html;text/xml;application/xhtml+xml;application/vnd.mozilla.xul+xml;text/mml;x-scheme-handler/http;x-scheme-handler/https;
Categories=Network;WebBrowser;
Actions=new-window;new-private-window;profile-manager-window;
[Desktop Action new-window]
Name=Open a New Window
Exec=$app_installation_directory/firefox --new-window %u
[Desktop Action new-private-window]
Name=Open a New Private Window
Exec=$app_installation_directory/firefox --private-window %u
[Desktop Action profile-manager-window]
Name=Open the Profile Manager
Exec=$app_installation_directory/firefox --ProfileManager
" >> $desktop_in_local_applications

echo "Created desktop entry successfully"

sleep 1

echo "Installation is successful"

sleep 1

echo "Done, and done, have fun!"

sleep 1

exit 0
