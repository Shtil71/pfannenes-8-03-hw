# Домашнее задание к занятию "`Защита Хоста`" - `Пфанненштиль Евгений`

# Отчёт по сканированию Metasploitable

## Задание 1
### Сетевые службы:
- 21/tcp: FTP (vsftpd 2.3.4)
- 22/tcp: SSH (OpenSSH 4.7p1)
- 80/tcp: HTTP (Apache 2.2.8)

### Уязвимости:
1. vsftpd 2.3.4 — [Exploit-DB #49757](https://www.exploit-db.com/exploits/49757)
2. Samba usermap_script — [Exploit-DB #16320](https://www.exploit-db.com/exploits/16320)

## Задание 2
### Сравнение режимов сканирования:
| Режим  | Ответ сервера       |
|--------|---------------------|
| SYN    | SYN/ACK или RST     |
| FIN    | RST (если порт закрыт) |
