# Instalando Certificado SSL
https://certbot.eff.org/lets-encrypt/ubuntubionic-apache

````
$ sudo snap install core; sudo snap refresh core
$ sudo apt-get remove certbot
$ sudo snap install --classic certbot
$ sudo ln -s /snap/bin/certbot /usr/bin/certbot
$ sudo certbot --apache
````


# Se já existe o certificado na máquina, para adicionar domínio só rodar
sudo certbot --apache
