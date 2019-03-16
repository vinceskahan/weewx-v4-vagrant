#
# vim: ts=2: bg=dark expandtab
#

#------- prerequisites ---------
apt-get install -y python3-dev python3-pip python3-configobj python3-serial python3-pil python3-usb
pip3 install pyephem
pip3 install cheetah3

#------- webserver ---------
apt-get install -y nginx
systemctl enable nginx.service
systemctl start nginx.service

#------- download weewx ---------
cd /var/tmp
apt-get install -y git
git clone https://github.com/weewx/weewx.git
cd weewx
git checkout python3

#------- install weewx ---------
python3 setup.py build
python3 setup.py install --no-prompt
sed -i 's:debug = 0:debug = 1:' /home/weewx/weewx.conf

#------- want webserver docroot to point to weewx files ---------
ln -s /var/www/html /home/weewx/public_html

#------- hook into startup sequence ---------
cp util/systemd/weewx.service /lib/systemd/system
systemctl enable weewx.service

#--------- my extensions -------------
cd /var/tmp

git clone https://github.com/vinceskahan/vds-weewx-v3-mem-extension.git
cd vds-weewx-v3-mem-extension
git checkout python3
/home/weewx/bin/wee_extension --install .

git clone https://github.com/vinceskahan/vds-weewx-lastrain-extension.git
cd vds-weewx-lastrain-extension
/home/weewx/bin/wee_extension --install .

#--------- start it up ---------------
systemctl start weewx.service
systemctl status weewx.service
