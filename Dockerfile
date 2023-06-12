#!/bin/bash

ARG wp_version=latest

FROM wordpress:${wp_version}

ARG php_version=8

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
	apt-get install -yq apt-utils nano

RUN if [ "$php_version" = 8 ] ; then pecl install xdebug && docker-php-ext-enable xdebug ; \ 
	elif [ "$php_version" = 7 ] ; then pecl install xdebug-3.1.5 && docker-php-ext-enable xdebug ; fi