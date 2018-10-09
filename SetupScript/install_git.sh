#!/bin/bash
source script_lib

function install_git()
{
	echo 'install git client...'
	yum -y install git || return 1
	yum -y install git-lfs || return 1
}

function install_gitlab()
{
	echo "install gitlab ..."
	
	gitlab_port=3000
	docker image pull gitlab/gitlab-ce
	docker run --detach --restart always --publish $gitlab_port:80 --name gitlab gitlab/gitlab-ce
	firewall-cmd --permanent --zone=public --add-port=$gitlab_port/tcp
	firewall-cmd --reload
}

install_git
if [ $? -ne 0 ]; then
	printc C_RED "install git error!"
	exit 1;
fi
install_gitlab
if [ $? -ne 0 ]; then
	printc C_RED "install gitlab error!"
	exit 1;
fi