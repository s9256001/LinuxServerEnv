#!/bin/bash
source script_lib

gitlab_container_name=my-gitlab

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
	gitlab_host_backup=/storage/gitlab/backups
	gitlab_container_backup=/var/opt/gitlab/backups
	mkdir $gitlab_host_backup -p
	docker image pull gitlab/gitlab-ce
	docker run -e "TZ=Asia/Taipei" -v $gitlab_host_backup:$gitlab_container_backup --detach --restart always --publish $gitlab_port:80 --name $gitlab_container_name gitlab/gitlab-ce
	firewall-cmd --permanent --zone=public --add-port=$gitlab_port/tcp
	firewall-cmd --reload
	
	(crontab -l ; echo "0 2 * * * /bin/docker exec -i "$gitlab_container_name" /opt/gitlab/bin/gitlab-rake gitlab:backup:create") | crontab
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