# Docker Wordpress

This is the Git repo for a docker wordpress environment.

## Installation

1) clone the repository
```
git clone https://github.com/ground-creative/docker-wordpress.git {folder-name}
```
2) Make changes to the environment variables file (.env)

3) Add hostname entry that u used in .env file to hosts file:
```
sudo nano /etc/hosts

127.0.0.1 {hostname}
```

4) Run build.sh script to build containers
```
sudo ./build.sh
```

4) Access the container via browser using the port and hostname specified in the .env file:

	http://{hostname}:{port}
	
## Uploads.ini file example

```
file_uploads = On
memory_limit = 64M
upload_max_filesize = 64M
post_max_size = 64M
max_execution_time = 600
```


