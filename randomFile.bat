@echo off 
 :: start of main
 rem Set your path here:
 set "workDir=C:\Users\hp\Desktop\utube"

 rem Read the %random%, two times is'nt a mistake! Why? Ask Bill.
 rem In fact at the first time %random% is nearly the same.
 @set /a "rdm=%random%"
 set /a "rdm=%random%"

 rem Push to your path.
 pushd "%workDir%"

 rem Count all files in your path. (dir with /b shows only the filenames)
 set /a "counter=0"
 for /f "delims=" %%i in ('dir /b ^|find "."') do call :sub1

 rem This function gives a value from 1 to upper bound of files
 set /a "rdNum=(%rdm%*%counter%/32767)+1"

 rem Start a random file
 set /a "counter=0"
 for /f "delims=" %%i in ('dir /b ^|find "."') do set "fileName=%%i" &call :sub2

 rem Pop back from your path.
 popd "%workDir%"

 goto :eof
 :: end of main

 :: start of sub1
 :sub1
 rem For each found file set counter + 1.
 set /a "counter+=1"
 goto :eof
 :: end of sub1

 :: start of sub2
 :sub2
 rem 1st: count again,
 rem 2nd: if counted number equals random number then start the file.
 set /a "counter+=1"
 if %counter%==%rdNum% (start "" "%fileName%")
 goto :eof
 :: end of sub2

 :: -snap--- end of batch
