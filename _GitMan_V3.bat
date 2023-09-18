::Рассматриваем возможность того что 
::Менюшка может быть сложнее чем просто папка с микробатниками
@echo off
cd %~dp0
echo %cd%
call :menu_03268
::echo "%date:~-4%.%date:~3,2%.%date:~0,2%_%TIME:~0,2%:%TIME:~3,2%:%TIME:~6,2%_%username%%"
PAUSE
exit /b

:menu_03268
setlocal
	set _id=1
	:menu_03268_begin
	set _counter=-1
	cls
	:::::::::::::::::::::::::::::::::::::::::::::::
		set /a _counter= %_counter%+1
		if "%1" EQU "" ((if %_id% EQU %_counter% (<nul set /p strTemp=*))&(echo Exit)
		)else (if %_id% EQU %_counter% (TIMEOUT /T 2)&(Exit))
		:::::::::::::::::::::::::::::::::::::::::::::::
		set /a _counter= %_counter%+1
		if "%1" EQU "" ((if %_id% EQU %_counter% (<nul set /p strTemp=*))&(echo ScriptGit+add.+AutoCommit+push)
		)else (if %_id% EQU %_counter% (
			git add .
			git status
			echo !!!
			echo "AutoCommit_%date:~-4%.%date:~3,2%.%date:~0,2%_%TIME:~0,2%:%TIME:~3,2%:%TIME:~6,2%_%username%%"
			echo !!!
			git commit -m "AutoCommit_%date:~-4%.%date:~3,2%.%date:~0,2%_%TIME:~0,2%:%TIME:~3,2%:%TIME:~6,2%_%username%%"
			git log -3
			echo git log ......
			git push
			TIMEOUT /T 5
			Exit
		))
		:::::::::::::::::::::::::::::::::::::::::::::::
		set /a _counter= %_counter%+1
		if "%1" EQU "" ((if %_id% EQU %_counter% (<nul set /p strTemp=*))&(echo ScriptGit+add.+Commit+push)
		)else (if %_id% EQU %_counter% (
			git add .
			git status
			git commit
			git log -3
			echo git log .......
			git push
			TIMEOUT /T 5
			Exit
		))
		:::::::::::::::::::::::::::::::::::::::::::::::::::
		set /a _counter= %_counter%+1
		if "%1" EQU "" ((if %_id% EQU %_counter% (<nul set /p strTemp=*))&(echo git init - Создать репозиторий)
		)else (if %_id% EQU %_counter% (git init))
		:::::::::::::::::::::::::::::::::::::::::::::::
		set /a _counter= %_counter%+1
		if "%1" EQU "" ((if %_id% EQU %_counter% (<nul set /p strTemp=*))&(echo git clone [InputFrom] - Клонировать репозиторий)
		)else (if %_id% EQU %_counter% (Set /P InputFrom=  git clone [InputFrom]^>))
		if "%1" NEQ "" (if %_id% EQU %_counter% (git clone %InputFrom%)&(TIMEOUT /T 2))
		:::::::::::::::::::::::::::::::::::::::::::::::
		set /a _counter= %_counter%+1
		if "%1" EQU "" ((if %_id% EQU %_counter% (<nul set /p strTemp=*))&(echo RD /s/q .git - Удалить папку Базы данных Git)
		)else (if %_id% EQU %_counter% (RD /s/q .git))
		:::::::::::::::::::::::::::::::::::::::::::::::
		set /a _counter= %_counter%+1
		if "%1" EQU "" ((if %_id% EQU %_counter% (<nul set /p strTemp=*))&(echo git log - вывести на экран список коммитов)
		)else (if %_id% EQU %_counter% (git log))
		:::::::::::::::::::::::::::::::::::::::::::::::
		set /a _counter= %_counter%+1
		if "%1" EQU "" ((if %_id% EQU %_counter% (<nul set /p strTemp=*))&(echo git status - посмотреть индекс)
		)else (if %_id% EQU %_counter% (git status))
		:::::::::::::::::::::::::::::::::::::::::::::::
		set /a _counter= %_counter%+1
		if "%1" EQU "" ((if %_id% EQU %_counter% (<nul set /p strTemp=*))&(echo git add . - добавить все в индекс)
		)else (if %_id% EQU %_counter% (git add .))
		:::::::::::::::::::::::::::::::::::::::::::::::
		set /a _counter= %_counter%+1
		if "%1" EQU "" ((if %_id% EQU %_counter% (<nul set /p strTemp=*))&(echo git commit - сделать коммит)
		)else (if %_id% EQU %_counter% (git commit))
		:::::::::::::::::::::::::::::::::::::::::::::::
		set /a _counter= %_counter%+1
		if "%1" EQU "" ((if %_id% EQU %_counter% (<nul set /p strTemp=*))&(echo git commit --all - сделать коммит, сделав индекс)
		)else (if %_id% EQU %_counter% (git commit --all))
		:::::::::::::::::::::::::::::::::::::::::::::::
		set /a _counter= %_counter%+1
		if "%1" EQU "" ((if %_id% EQU %_counter% (<nul set /p strTemp=*))&(echo git push --all - послать на центральный репозиторий)
		)else (if %_id% EQU %_counter% (git push --all))
		:::::::::::::::::::::::::::::::::::::::::::::::
		set /a _counter= %_counter%+1
		if "%1" EQU "" ((if %_id% EQU %_counter% (<nul set /p strTemp=*))&(echo cmd)
		)else (if %_id% EQU %_counter% (cmd))
		:::::::::::::::::::::::::::::::::::::::::::::::
		set /a _counter= %_counter%+1
		if "%1" EQU "" ((if %_id% EQU %_counter% (<nul set /p strTemp=*))&(echo git help)
		)else (if %_id% EQU %_counter% (git help)&(pause))
	:::::::::::::::::::::::::::::::::::::::::::::::
	if "%1" EQU "Do" (exit /b) else (choice /c ews)
	if %ErrorLevel% EQU 1 ((echo e)&(call :menu_03268_begin Do)&(set %ErrorLevel%=0))
	if %ErrorLevel% EQU 2 ((echo w)&(set /a _id= %_id%-1)&(set %ErrorLevel%=0))
	if %ErrorLevel% EQU 3 ((echo s)&(set /a _id= %_id%+1)&(set %ErrorLevel%=0))
	if %_id% LSS 0 set _id=%_counter%
	if %_id% GTR %_counter% set _id=0
	goto :menu_03268_begin
endlocal
exit /b