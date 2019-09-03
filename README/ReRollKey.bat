SET PATH="C:\Program Files\OpenSSL-Win64\bin"
Rem SET PATH="C:\Program Files (x86)\OpenSSL-Win32\bin"
openssl genpkey -algorithm RSA -out ..\PrivateKeyDONOTTOUCH\private_key.pem -pkeyopt rsa_keygen_bits:2048
openssl rsa -pubout -in ..\PrivateKeyDONOTTOUCH\private_key.pem -out ..\Local\public_key.pem
COPY ..\PrivateKeyDONOTTOUCH\private_key.pem ..\BackupKeys\private_key.pem
COPY ..\Local\public_key.pem ..\BackupKeys\public_key.pem
PAUSE