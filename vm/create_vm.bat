@echo off

set vm_name="ceserver"
set src_vdi="1. ceserver.vdi"
set dst_vdi="ceserver.vdi"
set bridge_if="Intel(R) Ethernet Connection (2) I219-V"

goto:main

:main
call vm.cmd check_exist %vm_name%
if %ERRORLEVEL% == 0 (
	goto:stop_vm
) else (
	goto:delete_vm
)

:stop_vm
echo stop vm...
call vm.cmd stop %vm_name% "acpipowerbutton"
timeout /t 2 > nul

:delete_vm
echo delete vm...
%vm_manage% unregistervm --delete %vm_name%
copy /z %src_vdi% %dst_vdi%
:create_vm
echo create vm...
%vm_manage% createvm --name %vm_name% --ostype RedHat_64 --register
%vm_manage% storagectl %vm_name% --name "IDE Controller" --add ide --controller PIIX4
%vm_manage% storageattach %vm_name% --storagectl "IDE Controller" --port 0 --device 0 --type hdd --medium %dst_vdi%
%vm_manage% modifyvm %vm_name% --cpus 2 --memory 2048 --nic1 bridged --bridgeadapter1 %bridge_if%