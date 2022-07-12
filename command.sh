#!/bin/bash

function mkcdir(){
	mkdir -p -- "$1" &&
	cd -P -- "$1"
}

function create(){
	mkcdir $1
	git init
	curl -H 'Authorization: token '"$PAT"'' --data '{"name":"'"$1"'"}' https://api.github.com/user/repos	
	git remote add origin git@github.com:USERNAME/$1.git
	touch README.md
	git add .
	git commit -m "initial commit"
	git push -u origin master
}
