@echo off
echo Below is the branch you can delete:(if not appear,it means someone edit it in some files)
git branch
set /p var=Please enter BRANCH_NAME you want to delete:
set /p var2=Please DOUBLE check BRANCH_NAME you want to delete:
if not %var% == %var2% goto end
echo %var2%
choice /C:YN /M:"Remove it? Right?"
if errorlevel 3 goto end 
if errorlevel 2 goto No 
if errorlevel 1 goto Yes

:Yes
git branch -d %var2%
GOTO end

:No 
echo Nothing happened!
GOTO end

:next
echo next
GOTO end

:end
echo byebye!

pause