@echo off

%1 %2
ver|find "5.">nul&&goto :st
mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :st","","runas",1)(window.close)&goto :eof
:st
copy "%~0" "%windir%\system32\" 

@echo off
set regkey=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe
reg add "%regkey%" /v "test" /f 1>nul 2>nul && (reg delete "%regkey%" /v "test" /f) || (echo.&echo.&echo ȱ��Ȩ�ޣ����Ҽ�����˽ű���ѡ���Թ���Ա������С���&pause>nul&exit)

:begin
cls
for /L %%i in (1,1,5) do echo.
set num=0
reg query "%regkey%" /v "Debugger" 1>nul 2>nul && goto undo || goto done

:done
set /P num=Ĭ�ϼ��±��滻ΪNotePad2[δ����]���Ƿ������� 1--�ǣ�����--�� �� :
echo %num%
if %num% equ 1 reg add "%regkey%" /v "Debugger" /d "\"%~dp0Notepad2.exe\" /z" /f
goto begin

:undo
set /P num=Ĭ�ϼ��±��滻ΪNotePad2[�ѿ���]���Ƿ�ȡ������ 1--�ǣ�����--�� �� :
echo %num%
if %num% equ 1 reg delete "%regkey%" /f
goto begin
��������������������������������������������������������������������