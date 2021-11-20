@ECHO OFF & setLocal EnableDelayedExpansion

:: Copyright Conor McKnight
:: https://github.com/C0nw0nk/ExtractNow
:: https://www.facebook.com/C0nw0nk

:: Script Settings

:: IF you like my work please consider helping me keep making things like this
:: DONATE! The same as buying me a beer or a cup of tea/coffee :D <3
:: PayPal : https://paypal.me/wimbledonfc
:: https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=ZH9PFY62YSD7U&source=url
:: Crypto Currency wallets :
:: BTC BITCOIN : 3A7dMi552o3UBzwzdzqFQ9cTU1tcYazaA1
:: ETH ETHEREUM : 0xeD82e64437D0b706a55c3CeA7d116407E43d7257
:: SHIB SHIBA INU : 0x39443a61368D4208775Fd67913358c031eA86D59

:: Directory we want to monitor for new files to unrar / unzip / extract
set path="F:\torrent\downloads"

:: Path to ExtractNow settings file
set settings_file=%LocalAppData%\ExtractNow\extractnow.ini

:: Time between re-scanning directory for new archive files to unrar / unzip / extract
set timeout_loop=120

:: ExtractNow installation path
set extractnow_install_path="%ProgramFiles(x86)%\ExtractNow\extractnow.exe"

:: Blacklist of files when searching / scanning directory to not try and extract files from
set search_blacklist=*.class;*.perm;*.iso;*.bin;

:: Blacklist files inside of archives from being extracted
set extraction_blacklist=*.class, *.ini,*.exe,*.nfo;

:: If you do not want to use extractnow to extract certain file types you can hand them to a external program to extract them like so
:: zip, rar, 7z are the examples i have created for you
:: set external_extraction_program=zip;"C:\\Program Files\\WinRAR\\unrar.exe" -o- x "{ArchivePath}" "{Destination}"\r\nrar;"C:\\Program Files\\WinRAR\\unrar.exe" -o- x "{ArchivePath}" "{Destination}"\r\n7z;"C:\\Program Files\\WinRAR\\unrar.exe" -o- x "{ArchivePath}" "{Destination}"\r\n
:: Do not use any external unrar use extractnow built in extractor libraries
set external_extraction_program=

:: End Edit DO NOT TOUCH ANYTHING BELOW THIS POINT UNLESS YOU KNOW WHAT YOUR DOING!

set root_path=%~dp0

set root_file_name_and_extension=%~nx0

color 0A
%*
set title=C0nw0nk - Automatic Archive Extraction script
TITLE %title%

:start_loop
if "%~1"=="" (
start /wait /B %root_path%%root_file_name_and_extension% go
) else (
goto begin
)
goto start_loop
:begin

set new_path=%path%
set "new_path=!new_path:"=!"
set "new_path=%new_path:/=\%"
set "new_path=%new_path:\\=\%"
set "new_path=%new_path:\=\\%"
set "new_path=!new_path!\\"

del %settings_file% 2>nul

echo [Software\ExtractNow] > %settings_file%
echo After Extraction Archives Delete=0 >> %settings_file%
echo After Extraction Archives Recycle=0 >> %settings_file%
echo After Extraction Destination Open=0 >> %settings_file%
echo After Extraction Program Clear=0 >> %settings_file%
echo After Extraction Program Close=1 >> %settings_file%
echo After Extraction Program Close If Successful=1 >> %settings_file%
echo After Extraction Program Run=0 >> %settings_file%
echo After Extraction Archives Delete Folder=0 >> %settings_file%
echo After Extraction Archives Move=0 >> %settings_file%
echo After Extraction Archives Recursive=1 >> %settings_file%
echo After Extraction Archives Fate Recursion=1 >> %settings_file%
echo After Extraction Archives Run=0 >> %settings_file%
echo After Extraction Files Delete Broken=0 >> %settings_file%
echo After Extraction Rename Single File=0 >> %settings_file%
echo After Extraction Rename Single File As Folder=0 >> %settings_file%
echo After Extraction Remove Duplicate Folder=0 >> %settings_file%
echo After Extraction Touch Destination=0 >> %settings_file%
echo Destination Overwrite=5 >> %settings_file%
echo Drop Extract Automatically=0 >> %settings_file%
echo Extract To Favorite Folder=1 >> %settings_file%
echo Sounds Off=1 >> %settings_file%
echo Hide Minimize Balloon ToolTip=1 >> %settings_file%
echo Deep Archive Detection=1 >> %settings_file%
echo Mode Test Archives=0 >> %settings_file%
echo Mode Extract Only Unextracted=1 >> %settings_file%
echo Startup Extract Automatically=1 >> %settings_file%
echo Startup Check For Updates=1 >> %settings_file%
echo Startup Minimize To Tray=0 >> %settings_file%
echo Startup Minimize=1 >> %settings_file%
echo Window Stay On Top=0 >> %settings_file%
echo Window Minimize To Tray=0 >> %settings_file%
echo Window Show Default Icons=0 >> %settings_file%
echo Window Allow Multiple Instances=0 >> %settings_file%
echo Window Auto Switch=1 >> %settings_file%
echo Window Log History=0 >> %settings_file%
echo Overwrite Last Option=0 >> %settings_file%
echo Password Use For Entire Archive=0 >> %settings_file%
echo Password Use For Entire Batch=0 >> %settings_file%
echo Password Use List=0 >> %settings_file%
echo Password Use List Prompt=0 >> %settings_file%
echo Password One Per Archive=1 >> %settings_file%
echo Password Timeout=0 >> %settings_file%
echo Password Timeout Seconds=45 >> %settings_file%
echo Directory Extract Automatically=1 >> %settings_file%
echo Search Mask Type=0 >> %settings_file%
echo Thread Priority=2 >> %settings_file%
echo Extract Favorite Folder={ArchiveFolder}\\{ArchiveName}\\ >> %settings_file%
echo Extract Archives Folder={Destination}\\archive\\ >> %settings_file%
echo Window Icon Module=extractnow.icl >> %settings_file%
echo Window Language=Auto >> %settings_file%
echo View Extract Auto Scroll=0 >> %settings_file%
echo View Extract Header Count=8 >> %settings_file%
echo View Extract Header 0 Visible=1 >> %settings_file%
echo View Extract Header 0 Width=389 >> %settings_file%
echo View Extract Header 0 Text=File >> %settings_file%
echo View Extract Header 0 Order=0 >> %settings_file%
echo View Extract Header 1 Visible=1 >> %settings_file%
echo View Extract Header 1 Width=213 >> %settings_file%
echo View Extract Header 1 Text=Status >> %settings_file%
echo View Extract Header 1 Order=1 >> %settings_file%
echo View Extract Header 2 Visible=1 >> %settings_file%
echo View Extract Header 2 Width=0 >> %settings_file%
echo View Extract Header 2 Text=Progress >> %settings_file%
echo View Extract Header 2 Order=2 >> %settings_file%
echo View Extract Header 3 Visible=0 >> %settings_file%
echo View Extract Header 3 Width=100 >> %settings_file%
echo View Extract Header 3 Text=Path >> %settings_file%
echo View Extract Header 3 Order=3 >> %settings_file%
echo View Extract Header 4 Visible=0 >> %settings_file%
echo View Extract Header 4 Width=0 >> %settings_file%
echo View Extract Header 4 Text=Size >> %settings_file%
echo View Extract Header 4 Order=4 >> %settings_file%
echo View Extract Header 5 Visible=0 >> %settings_file%
echo View Extract Header 5 Width=0 >> %settings_file%
echo View Extract Header 5 Text=Ext >> %settings_file%
echo View Extract Header 5 Order=5 >> %settings_file%
echo View Extract Header 6 Visible=0 >> %settings_file%
echo View Extract Header 6 Width=0 >> %settings_file%
echo View Extract Header 6 Text=Eta >> %settings_file%
echo View Extract Header 6 Order=6 >> %settings_file%
echo View Extract Header 7 Visible=0 >> %settings_file%
echo View Extract Header 7 Width=0 >> %settings_file%
echo View Extract Header 7 Text=Elapsed >> %settings_file%
echo View Extract Header 7 Order=7 >> %settings_file%
echo Window Main Position Left=928 >> %settings_file%
echo Window Main Position Top=803 >> %settings_file%
echo Window Main Position Right=1465 >> %settings_file%
echo Window Main Position Bottom=1096 >> %settings_file%
echo Window Main Position State=1 >> %settings_file%
echo Directory List=%new_path%*\r\n >> %settings_file%
echo Files Exclude Mask=%extraction_blacklist% >> %settings_file%
echo Search Mask=%search_blacklist% >> %settings_file%
echo External Commands=%external_extraction_program% >> %settings_file%
echo Extract Program To Run=cmd /c taskkill /IM extractnow.exe >> %settings_file%
echo Extract Archives Program To Run= >> %settings_file%
echo Search Path Last Used= >> %settings_file%
echo Password List Filename= >> %settings_file%

start /wait /b "%title%" %extractnow_install_path% %path%

echo Finished extracting found archives.

echo Waiting %timeout_loop% seconds before rescan directory.

C:\Windows\System32\TIMEOUT.exe /T %timeout_loop%

exit
