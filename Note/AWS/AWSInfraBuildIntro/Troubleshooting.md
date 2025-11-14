### AWS上のEC2へSSH接続ができない（パーミッションを644から600に変更して解決）。
% ssh -i ~/.ssh/XXX.pem XXX@XXX.XXX.XXX.XXX
The authenticity of host 'XXX.XXX.XXX.XXX (XXX.XXX.XXX.XXX)' can't be established.
ED25519 key fingerprint is SHA256:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'XXX.XXX.XXX.XXX' (ED25519) to the list of known hosts.
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@         WARNING: UNPROTECTED PRIVATE KEY FILE!          @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
Permissions 0644 for '.ssh/XXX.pem' are too open.
It is required that your private key files are NOT accessible by others.
This private key will be ignored.
Load key ".ssh/XXX.pem": bad permissions
XXX@XXX.XXX.XXX.XXX: Permission denied (publickey,gssapi-keyex,gssapi-with-mic).

% ls -al ~/.ssh
-rw-r--r--@  1 XXX  staff  1678 11 14 12:48 XXX.pem

% chmod 600 XXX.pem
% ls -al
total 40
-rw-------@  1 XXX  staff  1678 11 14 12:48 XXX.pem

% ssh -i .ssh/XXX.pem XXX@XXX.XXX.XXX.XXX
   ,     #_
   ~\_  ####_        Amazon Linux 2023
  ~~  \_#####\
  ~~     \###|
  ~~       \#/ ___   https://aws.amazon.com/linux/amazon-linux-2023
   ~~       V~' '->
    ~~~         /
      ~~._.   _/
         _/ _/
       _/m/'

$ exit
logout
Connection to XXX.XXX.XXX.XXX closed.
