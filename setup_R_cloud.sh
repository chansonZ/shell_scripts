## Add R Repo
sudo sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list'
gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -

## Update
sudo apt-get update

## Basic stuff
sudo apt-get -y install preload build-essential

## Decrease swappiness
sudo bash -c "echo 'vm.swappiness = 10' >> /etc/sysctl.conf"

## Create 2GB swap
sudo /bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=2048
sudo /sbin/mkswap /var/swap.1
sudo /sbin/swapon /var/swap.1
sudo sh -c 'echo "/var/swap.1 swap swap defaults 0 0 " >> /etc/fstab'

## Web server
sudo apt-get install -y nginx

## Java 8
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get -y install oracle-java8-installer oracle-java8-set-default

## Git
sudo apt-get -y install git
git config --global user.name "Jo-fai Chow"
git config --global user.email jofai.chow@gmail.com

## Other stuff
sudo apt-get -y install libapparmor1 gdebi-core
sudo apt-get -y install pandoc
sudo apt-get -y install p7zip-rar p7zip-full unace unrar zip unzip sharutils rar uudeview mpack arj cabextract file-roller
#sudo apt-get -y install texlive-latex-base texlive-fonts-recommended

## Install R (use v3.1.3 for now and wait until Shiny server supports v3.2)
sudo apt-get -y install r-base=3.1.3-1trusty r-base-core=3.1.3-1trusty r-base-dev=3.1.3-1trusty r-recommended=3.1.3-1trusty
sudo apt-get -y install libcurl4-gnutls-dev
sudo apt-get -y install ssh-askpass libopenblas-base libcurl4-openssl-dev libxml2-dev libtiff4-dev libxt-dev
sudo apt-get -y install libgdal1-dev libproj-dev
sudo apt-get -y install libglu1-mesa-dev

## RStudio Server (I am using the preview version)
wget https://s3.amazonaws.com/rstudio-dailybuilds/rstudio-server-0.99.435-amd64.deb
sudo gdebi rstudio-server-0.99.435-amd64.deb

## R Shiny Server
sudo su - \ -c "R -e \"install.packages('shiny', repos='http://cran.rstudio.com/')\""
sudo su - \ -c "R -e \"install.packages('rmarkdown', repos='http://cran.rstudio.com/')\""
wget http://download3.rstudio.org/ubuntu-12.04/x86_64/shiny-server-1.3.0.403-amd64.deb
sudo gdebi shiny-server-1.3.0.403-amd64.deb

## Clean up
sudo apt-get install -y -f
sudo apt-get -y upgrade
sudo apt-get autoremove
sudo apt-get -y autoclean
sudo apt-get -y clean

