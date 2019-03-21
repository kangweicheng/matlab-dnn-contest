@echo off
set /p var=Please Enter Message:
echo %var%
git rm -r --cached .
git add .
git commit -m "%var%"
