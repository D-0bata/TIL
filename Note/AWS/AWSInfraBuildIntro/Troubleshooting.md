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



### 多段接続を行いたい（~/.ssh/configを作成し、下記の通り設定することで解決）。
% cat ~/.ssh/config
Host XXX
    Hostname XXX.XXX.XXX.XXX
    User XXX
    IdentityFile ~/.ssh/XXX.pem

Host YYY
    Hostname YYY.YYY.YYY.YYY
    User YYY
    IdentityFile ~/.ssh/YYY.pem
    ProxyCommand ssh XXX -W %h:%p


Host ZZZ
    Hostname ZZZ.ZZZ.ZZZ.ZZZ
    User ZZZ
    IdentityFile ~/.ssh/ZZZ.pem
    ProxyCommand ssh XXX -W %h:%p

% ssh YYY
The authenticity of host 'YYY.YYY.YYY.YYY (<no hostip for proxy command>)' can't be established.
ED25519 key fingerprint is SHA256:YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'YYY.YYY.YYY.YYY' (ED25519) to the list of known hosts.
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
Connection to YYY.YYY.YYY.YYY closed.

% ssh ZZZ
The authenticity of host 'ZZZ.ZZZ.ZZZ.ZZZ (<no hostip for proxy command>)' can't be established.
ED25519 key fingerprint is SHA256:ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'ZZZ.ZZZ.ZZZ.ZZZ' (ED25519) to the list of known hosts.
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
Connection to ZZZ.ZZZ.ZZZ.ZZZ closed.
