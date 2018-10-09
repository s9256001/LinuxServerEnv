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
0. **hiredis**
	- Install 路徑
		- /usr/local/include/hiredis
		- /usr/local/lib
		- libhiredis
0. **MySQL connector/c**
	- Install 路徑
		- /usr/local/include/mysql (原路徑在 /usr/local/include，自己搬移到 /usr/local/include/mysql 下)
		- /usr/local/lib
		- libmysql
0. **zlib**
	- Install 路徑
		- /usr/local/include/zlib (原路徑在 /usr/local/include，自己搬移到 /usr/local/include/zlib 下)
		- /usr/local/lib
		- libz
0. **libuv**
	- Install 路徑
		- /usr/local/include/uv (原路徑在 /usr/local/include，自己搬移到 /usr/local/include/ub 下)
		- /usr/local/lib
		- libuv
0. **OpenSSL**
	- Install 路徑
		- /usr/local/include (原路徑在 /root/TestArea/LibBuild/openssl/ssloutput/include，自己搬移到 /usr/local/include/openssl 下)
		- /usr/local/lib (原路徑在 /root/TestArea/LibBuild/openssl/ssloutput/include/lib，自己搬移到 /usr/local/lib 下)
		- libcrypto, libssl	
0. **uWebSockets**
	- 相依套件
		- OpenSSL 1.x.x
		- zlib 1.x
		- libuv 1.3+ or Boost.Asio 1.x (both optional on Linux)
	- Install 路徑
		- /usr/local/include/uWS (原路徑在 /usr/include，自己搬移到 /usr/local/include 下)
		- /usr/local/lib64 (原路徑在 /usr/lib64，自己搬移到 /usr/local/lib64 下)
		- libuWS
	- 測試時需開通 port
	~~~
	firewall-cmd --permanent --zone=public --add-port=1234/tcp
	firewall-cmd --reload
	~~~