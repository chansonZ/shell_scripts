## ====================================================================
## Add All Repo and Key here ...
## ====================================================================

## R
echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" | sudo tee -a /etc/apt/sources.list
gpg --keyserver keyserver.ubuntu.com --recv E084DAB9 && gpg --export --armor E084DAB9 | sudo apt-key add -

## TLP for Power Management (OK)
sudo apt-get remove -y laptop-mode-tools
sudo add-apt-repository -y ppa:linrunner/tlp

## Java (OK)
sudo add-apt-repository -y ppa:webupd8team/java

## File Sync (OK)
sudo add-apt-repository -y ppa:freefilesync/ffs

## Weather and calendar
sudo add-apt-repository -y ppa:atareao/atareao

## Tweak
sudo add-apt-repository -y ppa:tualatrix/ppa

## Jayatana
sudo add-apt-repository -y ppa:danjaredg/jayatana

## Firefox fix
sudo add-apt-repository -y ppa:mc3man/trusty-media

## Spotify
sudo sh -c 'echo "deb http://repository.spotify.com/ stable non-free" > /etc/apt/sources.list.d/spotify.list'
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59

## Tor
sudo add-apt-repository -y ppa:webupd8team/tor-browser

## XBMC
sudo add-apt-repository -y ppa:team-xbmc/ppa

## Copy
sudo add-apt-repository -y ppa:paolorotolo/copy

## Caffeinate
sudo add-apt-repository -y ppa:caffeine-developers/ppa

## White Noise
sudo add-apt-repository -y ppa:costales/anoise

## ffmpeg
sudo add-apt-repository -y ppa:mc3man/trusty-media


## ====================================================================
## Update Repo Once
## ====================================================================

sudo apt-get update

## ====================================================================
## Core
## ====================================================================

## Core & Essential (OK)
sudo apt-get -y install preload build-essential

## Swap
sudo bash -c "echo 'vm.swappiness = 10' >> /etc/sysctl.conf"

## Power Management (OK)
sudo apt-get -y install tlp tlp-rdw
sudo tlp start

## ====================================================================
## Need to press enter manaully
## ====================================================================

sudo apt-get -y install ubuntu-restricted-extras libavcodec-extra ttf-mscorefonts-installer

## Java (OK)
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get -y install oracle-java8-installer oracle-java8-set-default

## ====================================================================
## The rest
## ====================================================================

## CPU Freq and System Indicators (OK)
sudo apt-get -y install gnome-applets cpufrequtils
sudo apt-get -y install indicator-cpufreq indicator-multiload
sudo apt-get -y install diodon diodon-plugins
sudo apt-get -y install calendar-indicator
sudo apt-get -y install my-weather-indicator

## better desktop experience (OK)
sudo apt-get -y install ulatency ulatencyd

## Git (OK)
sudo apt-get -y install git && git config --global user.name "Jo-fai Chow" && git config --global user.email jofai.chow@gmail.com

## Git Cola (OK)
sudo apt-get -y install git-cola

## Install R later
sudo apt-get -y install r-base r-base-core r-base-dev r-recommended
sudo apt-get -y install ssh-askpass libopenblas-base libcurl4-openssl-dev libxml2-dev libtiff4-dev libxt-dev
sudo apt-get -y install libgdal1-dev libproj-dev
sudo apt-get -y install libglu1-mesa-dev
## for EBImage
sudo apt-get -y install libfftw3-dev

## ISO Mount (OK)
sudo apt-get -y install furiusisomount

## Deluge for Bit Torret (OK)
sudo apt-get -y install deluge

## PlayOnLinux for Windows Apps (Not Now)
sudo apt-get -y install curl p7zip-full p7zip-rar playonlinux rar winbind

## File Sync (OK)
sudo apt-get -y install freefilesync

## Better App Management (OK)
sudo apt-get -y install gdebi synaptic

## VLC (OK)
sudo apt-get -y install vlc

## Ubuntu Tweak (Later)
sudo apt-get -y install ubuntu-tweak
sudo apt-get -y install unity-tweak-tool
sudo apt-get -y install compizconfig-settings-manager

## GIMP (OK)
sudo apt-get -y install gimp

## npm (OK)
sudo apt-get -y install npm

## gummi LaTeX editor with live preview (OK)
sudo apt-get -y install gummi

## Docky (OK)
sudo apt-get -y install docky

## Pandoc (OK)
sudo apt-get -y install pandoc

## Java HUD
sudo apt-get -y install jayatana

## Firefox fix
sudo apt-get -y install gstreamer0.10-ffmpeg
sudo apt-get -y install pepperflashplugin-nonfree

## Codec
sudo apt-get -y install libdvdread4
sudo /usr/share/doc/libdvdread4/install-css.sh

## Dropbox
sudo apt-get -y install dropbox
sudo apt-get -y install libappindicator1

## Codecs
sudo apt-get install -y gstreamer0.10-plugins-ugly gxine libdvdread4 totem-mozilla icedax tagtool easytag id3tool lame nautilus-script-audio-convert libmad0 mpg321 libavcodec-extra
sudo /usr/share/doc/libdvdread4/install-css.sh
sudo apt-get install -y libxine1-ffmpeg mencoder
sudo apt-get install -y ffmpeg gstreamer0.10-ffmpeg

## Compression
sudo apt-get install -y p7zip-rar p7zip-full unace unrar zip unzip sharutils rar uudeview mpack arj cabextract file-roller

## Firewall GUI
sudo apt-get install -y gufw


## ====================================================================
## Extra Stuff
## ====================================================================

## Improve Privacy (OK)
gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"

## Make nautilus better
sudo apt-get -y install nautilus-open-terminal
gsettings set org.gnome.nautilus.preferences enable-interactive-search false
gsettings set com.canonical.desktop.interface scrollbar-mode normal
nautilus -q

## minimize
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-minimize-window true

## ====================================================================
## Google Chrome
## ====================================================================

if [[ $(getconf LONG_BIT) = "64" ]]
then
	echo "64bit Detected" &&
	echo "Installing Google Chrome" &&
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&
	sudo dpkg -i google-chrome-stable_current_amd64.deb &&
	rm -f google-chrome-stable_current_amd64.deb
else
	echo "32bit Detected" &&
	echo "Installing Google Chrome" &&
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb &&
	sudo dpkg -i google-chrome-stable_current_i386.deb &&
	rm -f google-chrome-stable_current_i386.deb
fi




## ====================================================================
## Tex stuff
## ====================================================================

## TeX stuff for pdf (OK)
## http://www.chho.se/2013/04/21/installing-pdflatex-and-latex-for-ubuntu-12-04/ later
sudo apt-get -y install texlive-latex-base texlive-fonts-recommended

## Full Latex (OK)
sudo apt-get -y install texlive-full


## ====================================================================
## Spotify for Linux
## ====================================================================

## Read this
## http://www.omgubuntu.co.uk/2013/01/how-to-install-spotify-in-ubuntu-12-04-12-10

## Spotify (OK)
sudo apt-get -y install spotify-client


## ====================================================================
## Tor Browser
## ====================================================================

sudo apt-get -y install tor-browser


## ====================================================================
## XBMC
## ====================================================================

sudo apt-get -y install python-software-properties pkg-config
sudo apt-get -y install software-properties-common
sudo apt-get -y install xbmc


## ====================================================================
## Step 2
## ====================================================================

## http://ubuntu.aspcode.net/view/635400140124705175262042/xfce-docky-thunar-missing-icon

## Fix Docky
#sudo cp /usr/share/applications/Thunar.desktop ~/.local/share/applications
#sudo cp /usr/share/applications/xfce4-terminal.desktop ~/.local/share/applications
#sudo cp /usr/share/applications/* ~/.local/share/applications

## Fix Prime Indicator
#sudo convert /usr/lib/primeindicator/intel.png -resize 24x24 /usr/lib/primeindicator/intel.png
#sudo convert /usr/lib/primeindicator/nvidia.png -resize 24x24 /usr/lib/primeindicator/nvidia.png

## Copy
sudo add-apt-repository -y ppa:paolorotolo/copy
sudo apt-get update && sudo apt-get -y install copy
sudo /opt/copy-client/CopyAgent -installOverlay

cd /tmp
wget https://github.com/hotice/webupd8/raw/master/libdbusmenu-gtk-$(arch).tar.gz
tar -xvf libdbusmenu-gtk*
sudo cp /tmp/libdbusmenu-gtk*/* /opt/copy-client/

wget https://github.com/hotice/webupd8/raw/master/copy-icons.tar.gz
tar -xvf copy-icons.tar.gz
sudo cp copy-icons/copyagent.svg /usr/share/icons/hicolor/scalable/apps/
sudo cp copy-icons/copy.desktop /usr/share/applications/

sudo cp copy-icons/copy_dark.svg /usr/share/icons/hicolor/scalable/apps/copy.svg

## Caffeinate
sudo apt-get install -y caffeine

## White Noise
sudo apt-get -y install anoise anoise-community-extension1


## ====================================================================
## Final Clean Up and Reboot
## ====================================================================

sudo apt-get install -y -f
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get autoremove
sudo apt-get -y autoclean
sudo apt-get -y clean

