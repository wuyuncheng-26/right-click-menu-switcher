@echo off
echo ��ӭʹ���Ҽ��˵���ʽ�л����ߣ�
echo ��Ŀ��ַ��https://github.com/wuyuncheng-26/right-click-menu-switcher
choice /c 12 /m "1���л�Ϊ win10 ��ʽ   2���л�Ϊ win11 ��ʽ"
if %errorlevel% == 2 goto win11
if %errorlevel% == 1 goto win10

:win10
reg add HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32 /f /ve > nul
goto done

:win11
reg delete HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32 /f /ve > nul
goto done

:done
echo �л��ɹ����������� explorer.exe����
taskkill /f /im explorer.exe > nul
start explorer.exe
timeout /t 3