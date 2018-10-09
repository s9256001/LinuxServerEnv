git操作
=========================
0. **新增使用者**
	- 新增使用者
		- root 登入
		- Admin area > Overview > Users > New user
		- Create user
		- 再 Edit user 的密碼 為 12345678 (因為 mail 服務未設定)
	- 使用者確認登入
		- Setup new password: 重設密碼 (8 碼)
		- Sign in: 確認登入
0. **新增 group**
	- 新增 group
		- root 登入
		- New group
		- Create group
	- 新增 sugroup
		- New subgroup
		- Create group
0. **新增 project**
	- 新增 project
		- root 登入
		- New project
		- 勾選 Initialize repository with a README
		- Create project
0. **新增 project maintainer**
	- 新增 project maintainer
		- root 登入
		- Settings > Members
		- Add to Project
0. **clone git**
	~~~
	git clone http://192.168.11.200:3000/cegame/src/server.git
	~~~
0. **commit**
	~~~
	cd server
	touch test.txt
	git add test.txt
	git commit -m "add test.txt"
	git push -u origin master
	~~~	