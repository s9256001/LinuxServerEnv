#!/bin/bash
source script_lib

dev_common_path=/root/TestArea/LibBuild/dev_common
build_output_dir_name=build_output
lib_build_work_area=/root/TestArea/LibBuild

getInnerIP static_ip

function create_dev_common_path
{
	mkdir -p $dev_common_path/include
	mkdir -p $dev_common_path/lib
	mkdir -p $dev_common_path/lib64
}

function add_lib_path()
{
	echo 'add lib path...'

	create_dev_common_path

	(echo $dev_common_path/lib; echo $dev_common_path/lib64) > /etc/ld.so.conf.d/local.conf
	ldconfig
	
	cat /etc/ld.so.conf.d/local.conf
}

function build_hiredis()
{
	echo 'build hiredis...'

	create_dev_common_path

	pushd $PWD
	cd $lib_build_work_area
	git clone https://github.com/redis/hiredis.git
	cd hiredis
	mkdir $build_output_dir_name
	make
	make install PREFIX=$PWD/$build_output_dir_name

	cp -rf $build_output_dir_name/include/hiredis $dev_common_path/include/
	cp -rf $build_output_dir_name/lib/libhiredis.so* $dev_common_path/lib/
	popd
}

function build_mysql_connector_c()
{
	echo 'build MySQL connector/c...'
	
	create_dev_common_path

	pushd $PWD
	cd $lib_build_work_area
	git clone https://github.com/LuaDist/libmysql.git
	cd libmysql
	mkdir $build_output_dir_name
	cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=$PWD/$build_output_dir_name
	make
	make install

	mkdir $dev_common_path/include/mysql
	cp -rf $build_output_dir_name/include/* $dev_common_path/include/mysql/
	cp -rf $build_output_dir_name/lib/libmysql.so* $dev_common_path/lib/
	popd
}

function build_zlib()
{
	echo 'build zlib...'
	
	create_dev_common_path

	pushd $PWD
	cd $lib_build_work_area
	git clone https://github.com/madler/zlib.git
	cd zlib
	mkdir $build_output_dir_name
	./configure --prefix=$PWD/$build_output_dir_name
	make test
	make install

	mkdir $dev_common_path/include/zlib
	cp -rf $build_output_dir_name/include/* $dev_common_path/include/zlib/
	cp -rf $build_output_dir_name/lib/libz.so* $dev_common_path/lib/
	popd
}

function build_libuv()
{
	echo 'build libuv...'
	
	create_dev_common_path

	pushd $PWD
	cd $lib_build_work_area
	git clone https://github.com/libuv/libuv.git
	cd libuv
	mkdir $build_output_dir_name
	./autogen.sh
	./configure --prefix=$PWD/$build_output_dir_name
	make
	make check
	make install

	mkdir $dev_common_path/include/uv
	cp -rf $build_output_dir_name/include/* $dev_common_path/include/uv/
	cp -rf $build_output_dir_name/lib/libuv.so* $dev_common_path/lib/
	popd
}

function build_openssl()
{
	echo 'build OpenSSL...'
	
	create_dev_common_path

	pushd $PWD
	cd $lib_build_work_area
	git clone https://github.com/openssl/openssl.git
	cd openssl
	git tag -l
	git checkout tags/OpenSSL_1_0_2p
	mkdir $build_output_dir_name
	./config --openssldir=$PWD/$build_output_dir_name
	make
	make test
	make install

	cp -rf $build_output_dir_name/include/openssl $dev_common_path/include/
	cp -rf $build_output_dir_name/lib/*.a $dev_common_path/lib/
	popd
}

function build_uwebsocket()
{
	echo 'build uWebSockets...'
	
	create_dev_common_path

	pushd $PWD
	cd $lib_build_work_area
	git clone https://github.com/uNetworking/uWebSockets.git
	cd uWebSockets
	mkdir $build_output_dir_name
	make
	make install PREFIX=$PWD/$build_output_dir_name

	cp -rf $build_output_dir_name/include/uWS $dev_common_path/include/
	cp -rf $build_output_dir_name/lib64/libuWS.so* $dev_common_path/lib64/
	popd
}

function menu()
{
	time=$(date '+%Y-%m-%d %H:%M:%S')
	printc C_GREEN "================================================================\n"
	printc C_GREEN "= build libraries"
	printc C_WHITE " (IP: $static_ip, 目前時間: $time)\n"
	printc C_GREEN "================================================================\n"
	printc C_CYAN "  1. add library path\n"
	printc C_CYAN "  2. hiredis\n"
	printc C_CYAN "  3. MySQL connector/c\n"
	printc C_CYAN "  4. zlib\n"
	printc C_CYAN "  5. libuv\n"
	printc C_CYAN "  6. OpenSSL\n"
	printc C_CYAN "  7. uWebSockets\n"
	printc C_CYAN "  q. Exit\n"
	while true; do
		read -p "Please Select:" cmd
		case $cmd in
			1)
				add_lib_path
				return 0;;
			2)
				build_hiredis
				return 0;;
			3)
				build_mysql_connector_c
				return 0;;
			4)
				build_zlib
				return 0;;
			5)
				build_libuv
				return 0;;
			6)
				build_openssl
				return 0;;
			7)
				build_uwebsocket
				return 0;;
			[Qq]* )
				return 1;;
			* ) 
				echo "Please enter number or q to exit.";;
		esac
	done
}

while menu
do
	echo
done