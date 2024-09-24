!/bin/bash

# Проверяем доступность порта веб-сервера
port_to_check=8081 
if ! nc -z localhost $port_to_check; then
  echo "Порт $port_to_check недоступен"
  exit 1
fi

# Проверяем существование файла index.html
if [ ! -f /var/www/html/index.html ]; then
  echo "Файл /var/www/html/index.html не существует"
  exit 1
fi

echo "Все проверки прошли успешно"