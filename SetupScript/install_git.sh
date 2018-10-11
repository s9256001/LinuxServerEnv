#!/bin/bash
source script_lib

user_name=rd
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
	
	# mount the backup volume and use cron job to schedule the backup
	gitlab_port=3000
	gitlab_host_backup=/storage/gitlab/backups
	gitlab_container_backup=/var/opt/gitlab/backups
	docker image pull gitlab/gitlab-ce
	docker run -e "TZ=Asia/Taipei" -v $gitlab_host_backup:$gitlab_container_backup --detach --restart always --publish $gitlab_port:80 --name $gitlab_container_name gitlab/gitlab-ce
	firewall-cmd --permanent --zone=public --add-port=$gitlab_port/tcp
	firewall-cmd --reload
	
	# use rsync to backup
	rsync_conf_name=/etc/rsyncd.conf
	crudini --set $rsync_conf_name 'gitlab_backup' 'comment' gitlab_backup
	crudini --set $rsync_conf_name 'gitlab_backup' 'path' $gitlab_host_backup
	systemctl restart rsyncd
	
	# the crontab job of gitlab backup
	(crontab -l; echo "0 2 * * * /bin/docker exec -i "$gitlab_container_name" /opt/gitlab/bin/gitlab-rake gitlab:backup:create") | crontab
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