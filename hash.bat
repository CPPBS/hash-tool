@echo off
setlocal enabledelayedexpansion
title hash tool

echo       Num^|Type
echo.
echo 	0^|exit
echo 	1^|sha1
echo 	2^|sha256
echo 	3^|sha384
echo 	4^|sha512
echo 	5^|MACTripleDES
echo 	6^|MD5
echo 	7^|RIPEMD160
echo 	a^|ALL
echo.

:ask
set /p t= type:
if /i "%t%"=="0" exit
set alg=
if /i "%t%"=="1" set alg=SHA1
if /i "%t%"=="2" set alg=SHA256
if /i "%t%"=="3" set alg=SHA384
if /i "%t%"=="4" set alg=SHA512
if /i "%t%"=="5" set alg=MACTripleDES
if /i "%t%"=="6" set alg=MD5
if /i "%t%"=="7" set alg=RIPEMD160
if /i "%t%"=="a" set alg=ALL
if not defined alg (
    echo Invalid choice.
    pause
    goto ask
)

if "%*"=="" (
    echo No files dragged. Please drag files onto this batch file.
    pause
    goto ask
)

echo.
echo Processing files (Algorithm: %alg%) ...
echo.

for %%F in (%*) do (
    set "filename=%%~nxF"
    echo   [!filename!] ...
    if /i "!alg!"=="ALL" (
        for %%A in (SHA1 SHA256 SHA384 SHA512 MACTripleDES MD5 RIPEMD160) do (
            for /f "delims=" %%H in ('powershell -NoProfile -Command "(Get-FileHash -LiteralPath '%%~F' -Algorithm %%A).Hash" 2^>nul') do set "hash=%%H"
            if defined hash (
                set "algName=%%A                    "
                call echo     %%algName:~0,15%%: !hash!
            ) else (
                echo     %%A:	[ERROR]
            )
        )
    ) else (
        for /f "delims=" %%H in ('powershell -NoProfile -Command "(Get-FileHash -LiteralPath '%%~F' -Algorithm %alg%).Hash" 2^>nul') do set "hash=%%H"
        if defined hash (
            echo     Hash: !hash!
        ) else (
            echo     [ERROR] Failed to hash this file.
        )
    )
)

echo.
pause
goto ask