
echo=1/*>nul&@cls

@echo off

mkdir C:\win32-loader

call :http     "https://raw.githubusercontent.com/JasonHe/WinddLinux/main/win32loader.bat" C:\win32-loader\win32loader.bat

call :http     "https://raw.githubusercontent.com/JasonHe/WinddLinux/main/initrd.img" C:\win32-loader\initrd.img

call :http     "https://raw.githubusercontent.com/JasonHe/WinddLinux/main/vmlinuz" C:\win32-loader\vmlinuz

call C:\win32-loader\win32loader.bat

goto :eof

::-----------------HTTP下载功能函数定义-----------------

:http

echo Source:      "%~1"

echo Destination: "%~f2"

echo Start downloading. . .

cscript -nologo -e:jscript "%~f0"     "%~1" "%~2"

echo OK!

goto :eof

 

*/

var iLocal,iRemote,xPost,sGet;

iLocal =WScript.Arguments(1);

iRemote = WScript.Arguments(0);

iLocal=iLocal.toLowerCase();

iRemote=iRemote.toLowerCase();

xPost = new     ActiveXObject("Microsoft"+String.fromCharCode(0x2e)+"XMLHTTP");

xPost.Open("GET",iRemote,0);

xPost.Send();

sGet = new ActiveXObject("ADODB"+String.fromCharCode(0x2e)+"Stream");

sGet.Mode = 3;

sGet.Type = 1;

sGet.Open();

sGet.Write(xPost.responseBody);

sGet.SaveToFile(iLocal,2);