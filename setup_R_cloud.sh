## http://deanattali.com/2015/05/09/setup-rstudio-shiny-server-digital-ocean/

## First step
#adduser woobe
#gpasswd -a woobe sudo
#su - woobe

## Update
sudo apt-get update && sudo apt-get -y upgrade

## Web Server
sudo apt-get -y install nginx

## Restart web server
#sudo service nginx stop
#sudo service nginx start
#sudo service nginx restart

## Install R
sudo sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list'
gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -
sudo apt-get update && sudo apt-get -y install r-base

## Add Swap
sudo /bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=1024
sudo /sbin/mkswap /var/swap.1
sudo /sbin/swapon /var/swap.1
sudo sh -c 'echo "/var/swap.1 swap swap defaults 0 0 " >> /etc/fstab'

## Libraries for devtools
sudo apt-get -y install libcurl4-gnutls-dev libxml2-dev libssl-dev

## Install key R packages as root
sudo su - -c "R -e \"install.packages('devtools', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('shiny', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('rmarkdown', repos='http://cran.rstudio.com/')\""

## RStudio Server
sudo apt-get -y install libapparmor1 gdebi-core
wget https://s3.amazonaws.com/rstudio-dailybuilds/rstudio-server-0.99.435-amd64.deb
sudo gdebi rstudio-server-0.99.435-amd64.deb

## Shiny Server
wget http://download3.rstudio.org/ubuntu-12.04/x86_64/shiny-server-1.3.0.403-amd64.deb
sudo gdebi shiny-server-1.3.0.403-amd64.deb

## Give permission to folders
sudo chmod -R 777 /srv
sudo chmod -R 777 /usr
