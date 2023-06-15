# Docker Wordpress

This is the Git repo for a docker wordpress environment.

## Installation

1) Clone the repository
```
git clone https://github.com/ground-creative/docker-wordpress.git {folder-name}
```
2) Make changes to the environment variables file (.env)

3) Run build.sh script to build containers
```
sudo chmod +x build.sh

sudo ./build.sh
```
	
4) Add the container name entry that you used in .env file to your hosts file
```
sudo nano /etc/hosts

127.0.0.1 {container-name}
```

5) Access the container via browser using the port and container name specified in the .env file:

	http://{container-name}:{port}
	
## Uploads.ini file example

Add the volume to the docker-compose.yml file
```
 volumes:
	- ./config/uploads.ini:/usr/local/etc/php/conf.d/uploads.ini
```
Create a file called uploads.ini with the following content and place it in the config folder
```
file_uploads = On
memory_limit = 64M
upload_max_filesize = 64M
post_max_size = 64M
max_execution_time = 600
```

## Use with nginx ssl proxy

https://github.com/ground-creative/docker-nginx-proxy

1) Create the file docker-compose-override.yml and paste the following
```
version: '3.1'

services:

  db:
    networks:
      - proxy
  
  wordpress:
    networks:
      - proxy
    expose:
      - "80"
    environment:
	  # change email address value
      VIRTUAL_HOST: ${WP_CONTAINER_NAME}
      VIRTUAL_PORT: 80
      LETSENCRYPT_HOST: ${WP_CONTAINER_NAME}
      LETSENCRYPT_EMAIL: address@somedomain.com
        
  wpcli:
    networks:
      - proxy
      
  pma:
    networks:
      - proxy
  
networks:
  proxy:
    external:
      name: nginx-proxy
```

2) Rebuild the container
```
docker-compose up -d --build
```

3) Access the container at the specified address in the VIRTUAL_HOST field

	(http|https)://{VIRTUAL_HOST}