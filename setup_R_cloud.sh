## http://deanattali.com/2015/05/09/setup-rstudio-shiny-server-digital-ocean/

## First step
#adduser woobe
#gpasswd -a woobe sudo
#su - woobe


## ==============================================================================
## Add repo
## ==============================================================================

# R
sudo sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list'
gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -

# Java
sudo add-apt-repository -y ppa:webupd8team/java


## ==============================================================================
## Update and Core Packages
## ==============================================================================

sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get -y install preload build-essential


## ==============================================================================
## Swap
## ==============================================================================

sudo /bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=2048
sudo /sbin/mkswap /var/swap.1
sudo /sbin/swapon /var/swap.1
sudo sh -c 'echo "/var/swap.1 swap swap defaults 0 0 " >> /etc/fstab'
sudo bash -c "echo 'vm.swappiness = 10' >> /etc/sysctl.conf"

## Java (OK)
echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get -y install oracle-java7-installer oracle-java7-set-default

## Git (OK)
sudo apt-get -y install git && git config --global user.name "Jo-fai Chow" && git config --global user.email jofai.chow@gmail.com

## Web Server
sudo apt-get -y install nginx

## Restart web server
#sudo service nginx stop
#sudo service nginx start
#sudo service nginx restart

## ==============================================================================
## R
## ==============================================================================

## Install R
#sudo apt-get -y install r-base r-base-core r-base-dev r-recommended
sudo apt-get -y install ssh-askpass libopenblas-base libcurl4-openssl-dev libxml2-dev libtiff4-dev libxt-dev
sudo apt-get -y install libgdal1-dev libproj-dev
sudo apt-get -y install libglu1-mesa-dev
## for EBImage
sudo apt-get -y install libfftw3-dev

## Libraries for devtools
sudo apt-get -y install libcurl4-gnutls-dev libxml2-dev libssl-dev

## Install RRO
cd /tmp
wget https://mran.revolutionanalytics.com/install/RRO-3.2.1-Ubuntu-14.04.x86_64.tar.gz
wget https://mran.revolutionanalytics.com/install/RevoMath-3.2.1.tar.gz

tar -xzf RRO-3.2.1-Ubuntu-14.04.x86_64.tar.gz
cd RRO-3.2.1
sudo ./install.sh

cd ..
tar -xzf RevoMath-3.2.1.tar.gz
cd RevoMath
sudo ./RevoMath.sh
cd ..


## Install key R packages as root
sudo su - -c "R -e \"install.packages('devtools', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('shiny', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('rmarkdown', repos='http://cran.rstudio.com/')\""

## RStudio Server
sudo apt-get -y install libapparmor1 gdebi-core
wget https://s3.amazonaws.com/rstudio-dailybuilds/rstudio-server-0.99.467-amd64.deb
sudo gdebi rstudio-server-0.99.467-amd64.deb

## Shiny Server
wget https://download3.rstudio.org/ubuntu-12.04/x86_64/shiny-server-1.4.0.721-amd64.deb
sudo gdebi shiny-server-1.4.0.721-amd64.deb

## ==============================================================================
## Other Stuff
## ==============================================================================

## Pandoc (OK)
sudo apt-get -y install pandoc

## Compression
sudo apt-get install -y p7zip-rar p7zip-full unace unrar zip unzip sharutils rar uudeview mpack arj cabextract file-roller

## TeX stuff for pdf (OK)
sudo apt-get -y install texlive-latex-base texlive-fonts-recommended texlive-full

