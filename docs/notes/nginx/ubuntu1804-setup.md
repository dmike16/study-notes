## Ubuntu 18.04 Configuration

Install from package repo:

``` bash
    sudo apt update
    sudo apt install nginx
```

Adjust the firwall, we can chose between different Configuration

``` bash
sudo ufw app list

Output
Available applications:
  Nginx Full
  Nginx HTTP
  Nginx HTTPS
  OpenSSH
```

Chosing HTTPS:

``` bash
sudo ufw allow 'Nginx HTTPS'
```

Check server status:

``` bash
systemctl status nginx
```

Some commands:

``` bash
sudo systemctl start nginx
sudo systemctl stop nginx
sudo systemctl reload nginx
sudo systemctl disable nginx
sudo systemctl enable nginx
```

After edit nginx configuration file, we can check its syntax with:

``` bash
sudo nginx -t
```
