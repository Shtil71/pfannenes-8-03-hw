# Домашнее задание к занятию "`Защита Хоста`" - `Пфанненштиль Евгений`


### Задание 1

    sudo apt-get update
    sudo apt-get install ecryptfs-utils
    sudo adduser cryptouser
    sudo -i -u cryptouser
    ecryptfs-migrate-home -u cryptouser

![u1](https://github.com/user-attachments/assets/a695c0e0-9f06-43e8-a7cb-0efcc86bceb1)


### Задание 2

    sudo apt-get install cryptsetup
    sudo fdisk /dev/sda  #создание sda4
    sudo cryptsetup luksFormat /dev/sda4
    sudo cryptsetup open /dev/sda4 my_encrypted_partition
    sudo mkfs.ext4 /dev/mapper/my_encrypted_partition
    sudo mkdir /mnt/encrypted
    sudo mount /dev/mapper/my_encrypted_partition /mnt/encrypted
