# Docker Wordpress

This is the Git repo for a docker wordpress environment.

## Installation

1) clone the repository
```
git clone https://github.com/ground-creative/docker-wordpress.git {folder-name}
```
2) Make changes to the environment variables file (.env)

3) Run build.sh script to build containers
```
sudo ./build.sh
```

4) Access the container via browser using the port and hostname specified in the .env file:

	http://{hostname}:{port}
	
5) (Optional) Add the hostname entry that you used in .env file to your hosts file:
```
sudo nano /etc/hosts

127.0.0.1 {hostname}
```
	
## Uploads.ini file example

Add the volume to the docker-compose.yml file
```
 volumes:
	- ./config/uploads.ini:/usr/local/etc/php/conf.d/uploads.ini
```
Create a file called uploads.ini and place it in the config folder
```
file_uploads = On
memory_limit = 64M
upload_max_filesize = 64M
post_max_size = 64M
max_execution_time = 600
```


