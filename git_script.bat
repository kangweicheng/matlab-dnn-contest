@echo off
set /p var=Please Enter Message:
echo %var%
git rm -r --cached .
git add .
git commit -m "%var%"
set /p var2=Please Enter Message:
git push origin %var2%
pause