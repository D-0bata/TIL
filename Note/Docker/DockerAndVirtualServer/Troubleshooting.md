### メールの認証が未実施のため、Pullの実行時にエラー発生（迷惑メールに分類されていたDockerからのメールを介してメールアドレスの認証を実施して解決）。
obata_daichi@obatadaichinonotobukkukonpyuta DockerAndVirtualServer % docker container run --name apache01 -p 8080:80 -d httpd
Unable to find image 'httpd:latest' locally
docker: Error response from daemon: authentication required - email must be verified before using account

Run 'docker run --help' for more information
obata_daichi@obatadaichinonotobukkukonpyuta DockerAndVirtualServer % docker container run --name apache01 -p 8080:80 -d httpd
Unable to find image 'httpd:latest' locally
latest: Pulling from library/httpd
362fb3fff34e: Pull complete 
4f4fb700ef54: Pull complete 
99ee8b7662b8: Pull complete 
5ccbdb88b8c6: Pull complete 
51365f04b688: Pull complete 
25569deacbb2: Pull complete 
Digest: sha256:ecfd5ca1bfe1fc5e44a5836c5188bde7f397b50c7a5bb603a017543e29948a01
Status: Downloaded newer image for httpd:latest
b8ffe4d14f677ee860a375d1668a9f68773d75974d07410935b7b453a1d48d80