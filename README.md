# docker-php-site 
Initialize php site using docker technology

steck of  technology: php7.3, apache2, mariadb, cron

run the command to start the project "**docker-compose up -d**"

## Contents

- apacheConf/apache2.conf: general configuration of apache
- apacheConf/mysite.com.conf: general configuration of http site
- apacheConf/mysite.com.ssl.conf: general configuration of https site
- db: folder for databases
- env: folder for environment variables
- src: folder for sites
- cron: file with tasks of cron

## Customization

### For create new http site

- create new folder with site hostname in "src" folder example "newsite.com"
- create new folder with name "public_html" which will contains all files of new site in folder "newsite.com"
- create clone of "mysite.com.conf" file from folder "apacheConf" with name "newsite.com"
- change ServerAdmin and DocumentRoot parameters accordingly to "webmaster@newsite.com" and "/var/www/html/newsite.com/public_html"
- add new line "RUN a2ensite newsite.com.conf" near "enabled sites" comment line in Dockerfile 

### For enable https site

- get a pair of keys for your site using "Let's Encrypt" or similar service
- replace the keys in the "/src/mysite.com/ssl" folder
- remove the "#" character in the line "# RUN a2ensite mysite.com.ssl.conf" in the Dockerfile

### To check this site on the local computer. You must add a new rule to the hosts file on this computer.

- `127.0.0.1 mysite.com` this string should be added into `/etc/hosts` file
- open page `mysite.com` in your browser
