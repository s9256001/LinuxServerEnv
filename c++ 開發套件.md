c++ 開發套件
=========================
0. **VC 開發環境**
	- 拷貝 linux include
		- 假設 VS_LINUX_INCLUDE_PATH 為
		~~~
		C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\IDE\VC\Linux\include\usr
		~~~
		- 將 /usr/include 拷貝到 $VS_LINUX_INCLUDE_PATH\include 下
		- 將 /usr/local/include 拷貝到 $VS_LINUX_INCLUDE_PATH\local\include 下
	- 設定遠端連線
		- 工具 > 選項 > 跨平台 > 連線管理員 > 新增，新增遠端連線設定
	- 設定 linux 專案
		- 新增專案 > 跨平台 > Linux > 確定
		- 屬性 > 一般 > 遠端組建電腦，指定為要遠端鍊線的設定
		- 屬性 > VC++ 目錄 > 來源目錄，設定 $VS_LINUX_INCLUDE_PATH\local\include
		- 屬性 > 連結器 > 輸入 > 程式庫相依性，設定要連結的本地端 .a 檔 (如 libhiredis.a 輸入 hiredis 就好)
	- 使用方式
		- 可以遠端編譯、遠端執行
		- 偵錯 > Linux 主控台，可以看到遠端輸出結果
0. **Linux 設定**
	- 加入 library path
	~~~
	cd /etc/ld.so.conf.d/
	(echo /usr/local/lib; echo /usr/local/lib64) > local.conf
	ldconfig
	reboot
	~~~
0. **hiredis**
	- 安裝參考
		- https://github.com/redis/hiredis/issues/585
	- 安裝指令
		~~~
		git clone https://github.com/redis/hiredis.git
		cd hiredis
		make
		sudo make install
		~~~
	- Install 路徑
		- /usr/local/include/hiredis
		- /usr/local/lib
		- libhiredis
	- 測試 redis container
		- 建立 container
		~~~
		docker run --detach --publish 6379:6379 --name redis redis
		redis-server --version
		~~~
		- 測試 client
		~~~
		docker exec -it redis bash
		redis-cli ping
		~~~
0. **MySQL connector/c**
	- 安裝參考
		- https://github.com/LuaDist/libmysql/blob/master/BUILD.unix
	- 安裝指令
		~~~
		git clone https://github.com/LuaDist/libmysql.git
		cd libmysql
		cmake -G "Unix Makefiles"
		make
		sudo make install
		~~~
	- Install 路徑
		- /usr/local/include/mysql (原路徑在 /usr/local/include，自己搬移到 /usr/local/include/mysql 下)
		- /usr/local/lib
		- libmysql
	- 測試 MySQL container
		- 參考 https://medium.com/@lvthillo/customize-your-mysql-database-in-docker-723ffd59d8fb
		- 建立 container
		~~~
		docker build -t my-mysql .
		docker run --detach --publish 3306:3306 -e MYSQL_ROOT_PASSWORD=1234 --name my-mysql my-mysql
		mysql -V
		~~~
		- 測試 client
		~~~
		docker exec -it my-mysql bash
		mysql -uroot -p1234
		show databases;
		use casino;
		show tables;
		select * from acc limit 10;
		~~~
	- 解決 "mysql Client does not support authentication protocol requested by server; consider upgrading MySQL"
	~~~
	alter user root@'localhost' identified with mysql_native_password by '1234';
	alter user root@'%' identified with mysql_native_password by '1234';
	~~~
0. **zlib**
	- 安裝參考
		- https://github.com/madler/zlib
	- 安裝指令
		~~~
		git clone https://github.com/madler/zlib.git
		cd zlib
		./configure
		make test
		sudo make install
		~~~
	- Install 路徑
		- /usr/local/include/zlib (原路徑在 /usr/local/include，自己搬移到 /usr/local/include/zlib 下)
		- /usr/local/lib
		- libz
0. **libuv**
	- 安裝參考
		- https://github.com/libuv/libuv
	- 安裝指令
		~~~
		git clone https://github.com/libuv/libuv.git
		cd libuv
		./autogen.sh
		./configure
		make
		make check
		sudo make install
		~~~
	- Install 路徑
		- /usr/local/include/uv (原路徑在 /usr/local/include，自己搬移到 /usr/local/include/ub 下)
		- /usr/local/lib
		- libuv
0. **OpenSSL**
	- 安裝參考
		- https://github.com/openssl/openssl.git
	- 安裝指令
		~~~
		git clone https://github.com/openssl/openssl.git
		cd openssl
		git tag -l
		git checkout tags/OpenSSL_1_0_2p
		mkdir ssloutput
		./config --openssldir=/root/TestArea/LibBuild/openssl/ssloutput
		make
		make test
		sudo make install
		~~~
	- Install 路徑
		- /usr/local/include (原路徑在 /root/TestArea/LibBuild/openssl/ssloutput/include，自己搬移到 /usr/local/include/openssl 下)
		- /usr/local/lib (原路徑在 /root/TestArea/LibBuild/openssl/ssloutput/include/lib，自己搬移到 /usr/local/lib 下)
		- libcrypto, libssl	
0. **uWebSockets**
	- 安裝參考
		- https://github.com/uNetworking/uWebSockets/wiki/Misc.-details
	- 相依套件
		- OpenSSL 1.x.x
		- zlib 1.x
		- libuv 1.3+ or Boost.Asio 1.x (both optional on Linux)
	- 安裝指令
		~~~
		git clone https://github.com/uNetworking/uWebSockets.git
		cd uWebSockets
		make
		sudo make install
		~~~
	- Install 路徑
		- /usr/local/include/uWS (原路徑在 /usr/include，自己搬移到 /usr/local/include 下)
		- /usr/local/lib64 (原路徑在 /usr/lib64，自己搬移到 /usr/local/lib64 下)
		- libuWS
	- 測試時需開通 port
	~~~
	firewall-cmd --permanent --zone=public --add-port=1234/tcp
	firewall-cmd --reload
	~~~