@ECHO off
SET PATH="C:\Program Files\OpenSSL-Win64\bin"
Rem SET PATH="C:\Program Files (x86)\OpenSSL-Win32\bin"

Rem Encryptor
openssl rand -base64 128 > Local\key.bin
openssl rsautl -encrypt -inkey Received\public_key.pem -pubin -in Local\key.bin -out Encrypted\SECRETKEY
openssl enc -aes-256-cbc -salt -iter 1072161 -in Write.txt -out Encrypted\SECRET -pass file:Local\key.bin

Rem Received message Decryptor 
openssl rsautl -decrypt -inkey PrivateKeyDONOTTOUCH\private_key.pem -in Received\SECRETKEY -out Received\key.bin
openssl enc -d -aes-256-cbc -iter 1072161 -in Received\SECRET -out Read.txt -pass file:Received\key.bin

Rem Cleanup process
ECHO Done, view/send message now.
PAUSE
ECHO Removing blatantly leaving files next to their private_key...
PAUSE
ECHO ...Don't accidently press this doublecheck...
PAUSE
DEL Local\key.bin > Read.txt
DEL Encrypted\SECRET > Write.txt
DEL Encrypted\SECRETKEY
DEL Received\SECRET
DEL Received\SECRETKEY
Rem DEL Received\public_key.pem
ECHO Press any button to exit.
pause