# rsloan-environment
rsloan environment note

詳見 [rsloan](https://github.com/kancheng/rsloan) 

# Oracle Virtual Box

 - [ova file](https://drive.google.com/drive/folders/0B6XxBoBS2t6ndXNGYUdzVHJMSnM)

# OS
Ubuntu 14.04.5 LTS trusty

如果想要用 root 可以這麼做(不建議)
```
sudo passwd root
```
先裝常用工具
```
sudo apt-get install vim git -y
```

在家目錄建立 rws、prj 目錄
```
mkdir ~/rws
mkdir ~/prj
```

# R

```
sudo sh -c 'echo "deb http://cran.csie.ntu.edu.tw/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list'
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
sudo apt-get update
sudo apt-get install -y r-base libcurl4-openssl-dev libxml2-dev espeak
```

# R Shiny Server

```
sudo apt-get install -y gdebi-core
wget http://download3.rstudio.org/ubuntu-12.04/x86_64/shiny-server-1.3.0.403-amd64.deb
sudo gdebi shiny-server-1.3.0.403-amd64.deb
```

瀏覽器
```
localhost:3838
```

# 解決 Shiny Server 套件來源的問題

註解掉 etc/Renviron 檔案上的來源設定
```
**R_LIBS_USER=${R_LIBS_USER-‘~/R/x86_64-pc-linux-gnu-library/3.3’} **
```
Reference :
http://withr.me/set-up-shiny-server-on-ubuntu-16.04/

```
sudo vim /usr/lib/R/etc/Renviron
```

# check the default library path in R:

```
sudo su - -c "R -e \".libPaths()\""
```

# Install the Shiny R package

```
sudo su - -c "R -e \"install.packages('shiny', repos='http://cran.rstudio.com/')\""
```

# R package install several dependencies or environment

```
sudo apt-get install -y libcurl4-openssl-dev  libssl-dev libxml2-dev libcairo-dev

sudo apt-get install -y default-jdk
export LD_LIBRARY_PATH=/usr/lib/jvm/java-8-openjdk-amd64/jre/lib/amd64/server/
sudo R CMD javareconf 

sudo chmod 777 /usr/local/lib/R/site-library
```


# R Studio Server
https://www.rstudio.com/products/rstudio/download/

```
sudo apt-get install gdebi-core -y
wget https://download2.rstudio.org/rstudio-server-1.0.136-amd64.deb
sudo gdebi rstudio-server-1.0.136-amd64.deb
```

```
localhost:8787
```
# RStudio Desktop
https://www.rstudio.com/products/rstudio/download/

看習慣決定要不要裝 RStudio Desktop

# use R File Edit
執行 rfile 目錄下的 pbpkgs.R 檔案。 

pbpkgs.R
```
local({r = getOption("repos")
r["CRAN"] = "https://cloud.r-project.org/"
options(repos=r)})

pkgs = c("devtools", "lattice", "GGally", "lubridate", "stringr", "ggplot2", "scales",
 "reshape2", "data.table", "coefplot", "broom", "RJDBC", "XLConnect", "RJSONIO", "sp", "png", "pixmap", "mapdata", "maptools", "maps", "rgeos", "Rcmdr")

pkgs = pkgs[!( pkgs %in% installed.packages()[,"Package"] )]

# install
if(length(pkgs)){
	install.packages(pkgs)
}

require(devtools)
install_github('rCharts', 'ramnathv')
```

# Edit R Rprofile.site

```
sudo vim /usr/lib/R/etc/Rprofile.site
```

```
# Haoye edit 
.First = function(){
	# work dir
	# setwd("/home/username/rws")
	setwd("/home/haoye/rws")

	# set a CRAN mirror
	# Automatic redirection to servers worldwide, currently sponsored by Rstudio
	local({r = getOption("repos")
	r["CRAN"] = "https://cloud.r-project.org/"
	options(repos=r)})

	# require package
	pkgs = c("devtools", "lattice", "GGally", "lubridate", "stringr", "ggplot2", "scales", "reshape2", "data.table", "coefplot", "broom")
	for(pkg in pkgs) {
  		library(pkg, character.only = TRUE)
	}
}


.Last = function(){ 

}
```


# LAMP

```
sudo apt-get install mariadb-server mariadb-client -y

passwd * 2

sudo apt-get install apache2 -y

sudo apt-get install php5 libapache2-mod-php5 -y

sudo service apache2 restart
```

# php test

```
sudo vim /var/www/html/info.php
```

```
<?php
phpinfo();
?>
```

瀏覽器
```
localhost/info.php
```

```
sudo apt-cache search php5

sudo service apache2 restart

sudo apt-get install php5-mysql php5-curl php5-gd php5-intl php-pear php5-imagick php5-imap php5-mcrypt php5-memcache php5-ming php5-ps php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-xsl

sudo service apache2 restart

sudo apt-get install php5-xcache

sudo service apache2 restart
```


```
sudo apt-get install phpmyadmin -y
```

apache2

NO

```
sudo ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin

sudo /etc/init.d/apache2 reload

sudo apt-get install php5-mcrypt -y

sudo php5enmod mcrypt

sudo service apache2 restart
```


# RMySQL 套件
```
sudo apt-get update

sudo apt-get install r-cran-rmysql -y

install.packages("RMySQL")

sudo su - -c "R -e \"install.packages('RMySQL', repos='http://cran.rstudio.com/')\""

sudo apt-get install libmariadb-client-lgpl-dev -y

ls /tmp/Rtmp*****R/downloaded_packages

whereis mysql

R CMD INSTALL --configure-args='--with-mysql-dir=/usr/lib/mysql' /tmp/Rtmp****R/downloaded_packages/RMySQL_0*****.tar.gz

mysql -u root -p
```


# Mariadb & RMySQL 的測試
```
create database rmysql;
grant all on rmysql.* to rmysql@'%' identified by 'rmysql';
grant all on rmysql.* to rmysql@localhost identified by 'rmysql';
use rmysql

CREATE TABLE t_user(
id INT PRIMARY KEY AUTO_INCREMENT,
user varchar(12) NOT NULL UNIQUE
)ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO t_user(user) values('A1'),('AB'),('fens.me');

SELECT * FROM t_user;
```

# R test RMySQL

```
library(RMySQL)

conn = dbConnect(MySQL( ), dbname = "rmysql", username = "root", password = "your_passwd")

users = dbGetQuery(conn, "SELECT * FROM t_user")

dbDisconnect(conn)

users
```



# 錯誤狀況解決
Failed to connect to database: Error: Can't connect to local MySQL server through socket '/tmp/mysql.sock'

```
ln -s /var/run/mysqld/mysqld.sock /tmp/mysql.sock
```


