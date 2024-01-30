apt-get install -y snapd
snap install --classic certbot

#Check the port 80 if its already in use or not    
netstat -tunlp

#If you're going to use --standalone mode then stop any service which is currently using port 80
systemctl stop pritunl
netstat -tunlp

#Install the cerbot
certbot certonly --standalone
#You can also use --nginx if you are configuring it with nginc

## Only follow below steps if nothing works after cert-bot setup#
   
sudo nano /etc/pritunl.conf
        "lets_encrypt": true,
        "acme_domain": "vpn.test.harness.org.au",
        "acme_key": "/etc/letsencrypt/live/vpn.test.harness.org.au/privkey.pem",
        "acme_cert": "/etc/letsencrypt/live/vpn.test.harness.org.au/fullchain.pem"
## 

systemctl start pritunl
sudo pritunl setup-key
sudo pritunl default-password
systemctl restart pritunl
