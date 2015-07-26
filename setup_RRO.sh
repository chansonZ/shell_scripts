# https://mran.revolutionanalytics.com/documents/rro/installation/#revorinst-lin

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
