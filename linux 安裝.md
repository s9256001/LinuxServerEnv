架設 Linux 環境
=========================
0. **安裝 CentOS VM**
	- 下載 CentOS minimal iso (如 CentOS-7-x86_64-Minimal-1804.iso)
		- 網址: https://www.centos.org/download/
	- VirtualBox 新增虛擬機
		- 名稱: ceserver
		- 類型: Linux
		- 版本: Red Hat (64-bit)
		- 記憶體: 2048 MB
		- 立即建立虛擬硬碟，VDI (VirtualBox 磁碟映像)
		- 動態配置，虛擬硬碟 100 GB
		- 設定值: 系統 > 處理器 > 2 顆 CPU，網路 > 介面卡 1 > 橋接介面卡
		- 設定值: 存放裝置 > 控制器: IDE > 空 > 選擇虛擬 CD/DVD 磁碟檔案 (如 CentOS-7-x86_64-Minimal-1804.iso)
		- 啟動
	- 安裝 CentOS 7
		- Language: English
		- INSTALLATION DESTINATION > Done
		- Begin Installation
		- ROOT PASSWORD: 密碼 a
		- USER CREATION: 使用者名稱 rd，密碼 a
		- 安裝完選 Reboot
		- 映像檔 存在 C:\Users\[使用者名稱]\VirtualBox VMs\ceserver\ceserver.vdi，可以複製備份用
0. **設定內網 IP**
	- 以 root 登入
	- 獲得自動分配到的 IP
		- 啟動網卡: ifup enp0s3
		- 取得分配到的 IP 位置: hostname -I
	- 複製安裝用的腳本
		- cd SetupScript
		- chmod u+x *.sh
	- 執行設定內網 IP 的腳本
		- ./setup_network.sh
0. **安裝系統工具**
	- ./install_systool.sh
		- 系統工具
		- samba
		- rsync
		- docker
0. **安裝 git**
	- ./install_git.sh
		- git client
		- docker gitlab/gitlab-ce
	- Change your password
		- 設定 root 密碼 (8 碼)
		- Sign in: root 確認登入
0. **安裝開發工具**
	- ./install_devtool.sh
		- gcc、gcc-c++、gdb
		- automake、cmake
		- mysql-devel