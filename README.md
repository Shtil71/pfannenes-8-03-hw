# Домашнее задание к занятию "`Система мониторинга Zabbix 2`" - `Пфанненштиль Евгений`


### Задание 1

1. apt-get install postgresql
2. wget https://repo.zabbix.com/zabbix/6.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.4-1+ubuntu22.04_all.deb
3. dpkg -i zabbix-release_6.4-1+ubuntu22.04_all.deb
4. apt update
5. apt install zabbix-server-pgsql zabbix-frontend-php php8.1-pgsql zabbix-apache-conf zabbix-sql-scripts zabbix-agent
6. # sudo -u postgres createuser --pwprompt zabbix
   # sudo -u postgres createdb -O zabbix zabbix
# zcat /usr/share/zabbix-sql-scripts/postgresql/server.sql.gz | sudo -u zabbix psql zabbix
# systemctl restart zabbix-server zabbix-agent apache2
# systemctl enable zabbix-server zabbix-agent apache2 

![alt text](https://github.com/Shtil71/pfannenes-8-03-hw/blob/main/dz1.jpg)
`При необходимости прикрепитe сюда скриншоты
![Название скриншота 1](ссылка на скриншот 1)`


---

### Задание 2
![alt text](https://github.com/Shtil71/pfannenes-8-03-hw/blob/main/dz2.jpg)
![alt text](https://github.com/Shtil71/pfannenes-8-03-hw/blob/main/dz3.jpg)
![alt text](https://github.com/Shtil71/pfannenes-8-03-hw/blob/main/dz4.jpg)


