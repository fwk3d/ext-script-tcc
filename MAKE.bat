git clone https://github.com/TinyCC/tinycc 
pushd tinycc\win32
git checkout 085e029
call build-tcc -c cl
popd

xcopy tinycc\win32\libtcc.dll x64\ /yes
xcopy tinycc\win32\lib\*.a    x64\lib\ /yes
xcopy tinycc\win32\lib\*.def  x64\lib\ /yes
rem xcopy tinycc\win32\include\libtcc /yes
rem xcopy tinycc\win32\*.lib x64\ /yes

xcopy tinycc\win32\include\* x64\include\ /yes

for %%i in (x64\*.exe;x64\*.dll) do dumpbin /dependents %%i | find /i "CRT"