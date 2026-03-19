#!/bin/bash

set -e

print_message() {
	echo "[INFO] $1"
}

print_error() {
	echo "[ERROR] $1"
}

new_post() {
	
	if [ -z "$1" ]; then
		print_error "Título do post não especificado"
		print_message "Uso: ./scripts/dev.sh new-post 'Título do Post'"
		exit 1
	fi
	DATE_PATH=$(date +%Y/%m/%d)
	POST_DIR="content/posts/${DATE_PATH}/$(echo "$1" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/-\+/-/g' | sed 's/^-\|-$//g')"
	
	print_message "Criando post: $POST_DIR"
    
    	mkdir -p "$POST_DIR"

	cat > "$POST_DIR/index.md" << EOF
---
title: "$1"
date: $(date +%Y-%m-%dT%H:%M:%S%z)
draft: false
description: "Descrição do post aqui"
tags: []
categories: []

featuredImage: ""
lightgallery: true


---

Conteúdo do post aqui...

EOF
    
    print_message "Post criado em: $POST_DIR/index.md"
}

start_dev() {

	print_message "Iniciando ambiente"
	hugo server --logLevel debug --disableFastRender -p 1313

}


main () {

  case "${1:-help}" in 
	new-post)
		shift
		new_post "$@"
		print_message "OK"
	;;
	start)
	       start_dev
       	;;	       

	*)
		
		print_error "Comando desconhecido: $1"
		exit 1
		;;

	esac
}

main "$@"
