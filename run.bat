@ECHO OFF
::========================================
SET GITHUB_ACCOUNT=https://github.com/NataliaIakovleva
SET WS_DIR=D:\GoogleDisc\Nata_QA\Workspace_homework_36
SET REPO_NAME=Title_Validation_CSV
SET APP_VERSION=1.1
SET MAIN_CLASS=core.QA.Selenium
set APP_NAME=QA-1.1-jar-with-dependencies.jar
SET ARGS_01=
::========================================
 
::========================================
::SET GITHUB_ACCOUNT=%1
::SET WS_DIR=%2
::SET REPO_NAME=%3
::SET APP_VERSION=%4
::SET MAIN_CLASS=%5
::SET ARGS_01=%6
::========================================
 
IF "%JAVA_HOME%" == "" GOTO EXIT_JAVA
ECHO Java installed
IF "%M2_HOME%" == "" GOTO EXIT_MVN
ECHO Maven installed
CALL git --version > nul 2>&1
IF NOT %ERRORLEVEL% == 0 GOTO EXIT_GIT
ECHO Git installed

GOTO NEXT
 
:NEXT
IF NOT EXIST %WS_DIR% GOTO NO_WORKSPACE
IF EXIST %WS_DIR%\%REPO_NAME% RMDIR /S /Q %WS_DIR%\%REPO_NAME%
CD %WS_DIR%
git clone https://github.com/NataliaIakovleva/Title_Validation_CSV
CD %REPO_NAME%
SLEEP 3
CALL mvn package
ECHO.
ECHO Start executing Java programm ...
java -cp %WS_DIR%\%REPO_NAME%\target\%APP_NAME% %MAIN_CLASS% win
GOTO END
 
:EXIT_JAVA
ECHO No Java installed
GOTO END
:EXIT_MVN
ECHO No Maven installed
GOTO END
:EXIT_GIT
ECHO Git not installed
GOTO END
:NO_WORKSPACE
ECHO %WS_DIR% is not exists
GOTO END
:END
CD\
