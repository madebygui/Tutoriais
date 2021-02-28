# Instruções

 1. Criar uma instância e configurar nas seguintes condições:
	 1. e2-small
	 2. 20GB de HD
	 3. southamerica-east1-a
 2. Abrir o ssh

### Step 1: Setup Project and VM (micro**)
`sudo apt update && sudo apt upgrade`

### Step 2: Install Swap

```
$ sudo fallocate -l 1G /swapfile  
$ sudo dd if=/dev/zero of=/swapfile bs=1024 count=1048576  
$ sudo chmod 600 /swapfile  
$ sudo mkswap /swapfile  
$ sudo swapon /swapfile  
$ sudo nano /etc/fstab  
$ sudo mount -a

```
### Conteúdo do arquivo
`/swapfile swap swap defaults 0 0`

### Step 3: Install LAMP Stack (Linux, Apache, MySQL, and PHP)

```
$ sudo apt install tasksel
$ sudo tasksel install lamp-server
$ sudo apt install php-curl php-gd php-mbstring php-xml php-xmlrpc
$ sudo add-apt-repository ppa:ondrej/php  
$ sudo apt-get update
$ sudo apt-get install php7.3
$ sudo apt install php7.3-cli php7.3-fpm php7.3-json php7.3-pdo php7.3-mysql php7.3-zip php7.3-gd  php7.3-mbstring php7.3-curl php7.3-xml php7.3-bcmath php7.3-json php7.3-xmlrpc
$ sudo phpenmod pdo_mysql
$ sudo a2enmod rewrite
```

`$ sudo nano /etc/apache2/apache2.conf`

```
<Directory /var/www/> 
    Options Indexes FollowSymLinks
    AllowOverride All -> Mudar essa linha
    Require all granted
</Directory>
```

`$ sudo /etc/init.d/apache2 restart`

### Step 4: Configure Domain

**Setup DNS**  
-Go to your web domain registrar and create A record pointing to your new server  
**Configure Apache conf for website**

```
$ cd /var/www` *- Diretório do site*
$ cd /etc/apache2/sites-available
$ cp 000-default.conf example.com.conf
$ nano example.com.conf
```

```
<Directory /var/www/example.com>  
        Require all granted
	AllowOverride All
</Directory>  
<VirtualHost *:80>  
        ServerName example.com 
        ServerAlias www.example.com 
        ServerAdmin webmaster@localhost  
        DocumentRoot /var/www/example.com  
</VirtualHost>

```


```
$ a2dissite 000-default.conf
$ a2ensite example.com.conf
$ a2enmod rewrite
$ systemctl reload apache2
```

### Step 5: Prep Database and PHP

**Create database**

```
$ mysql -u root  
> CREATE DATABASE wordpress;  
> GRANT ALL ON wordpress.* TO 'wordpressuser' IDENTIFIED BY 'Secure1234!';  
> quit  
$ mysql_secure_installation

```

**Edit /etc/php/7.3/apache2/php.ini**

```
max\_input\_time = 30  
upload\_max\_filesize = 20M  
post\_max\_size = 21M
```
`$ systemctl reload apache2`
