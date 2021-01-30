# poney
mise en place de deux adresses pour le serveur apache

```txt
- www.poney.local  gestion du front
- poney.back.local gestion du back
```

la configuration des deux adresse apache se puisuit la /etc/hosts:

```
- 127.0.1.1       www.poney.local
- 127.0.1.1       poney.back.local
```

creation des hosts virtuels dans /etc/apache2/sites-available/

fichier ``` poney.front.conf``` , ici l'acces se fera su le port 8082:

```md
<VirtualHost *:8082>
        ServerAdmin root@localhost
        DocumentRoot "/home/cordeliag13/Documents/apache/poney-1/frontend"
	ServerName www.poney.f.local
        <Directory "/home/cordeliag13/Documents/apache/poney-1/frontend">
		Options +FollowSymLinks
		AllowOverride all
		Require all granted
	</Directory>
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>
```

fichier ``` poney.back.conf``` :

```md
<VirtualHost *:8082>
        ServerAdmin root@localhost
        DocumentRoot "/home/cordeliag13/Documents/apache/poney-1/backend"
	ServerName www.poney.b.local
        <Directory "/home/cordeliag13/Documents/apache/poney-1/backend">
		Options +FollowSymLinks
		AllowOverride all
		Require all granted
	</Directory>
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>

```

la mise d'un vistuelhost sur le port 8082, a necessité la figuration du nouveau port dans le dossier apache ``` /etc/apache2/ports.conf ```

```md
Listen 8082

<IfModule ssl_module>
	Listen 443
</IfModule>

<IfModule mod_gnutls.c>
	Listen 443
</IfModule>
```

-----------------------------------------

***Pour ce projets le front sera réaliser en vueJS, et le back en php.***

**1-
partie back:**

creation de la base de donnéedans un fichier bdd.sql, une fois fini celle ci a été intergret a mysql.

creation du fichier bdd.php, qui contient les informations d'accès a la bdd du projet. ce fichier est integrer au fichier gitigrore, pour plus de confidentialité.

**2-
partie front**
