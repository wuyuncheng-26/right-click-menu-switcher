@echo off
echo 欢迎使用右键菜单样式切换工具！
echo 项目地址：https://github.com/wuyuncheng-26/right-click-menu-switcher
choice /c 12 /m "1、切换为 win10 样式   2、切换为 win11 样式"
if %errorlevel% == 2 goto win11
if %errorlevel% == 1 goto win10

:win10
reg add HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32 /f /ve > nul
goto done

:win11
reg delete HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32 /f /ve > nul
goto done

:done
echo 切换成功！即将重启 explorer.exe……
taskkill /f /im explorer.exe > nul
start explorer.exe
timeout /t 3