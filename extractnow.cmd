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
::set external_extraction_program=zip;"C:\\Program Files\\WinRAR\\unrar.exe" -o- x "{ArchivePath}" "{Destination}"\r\nrar;"C:\\Program Files\\WinRAR\\unrar.exe" -o- x "{ArchivePath}" "{Destination}"\r\n7z;"C:\\Program Files\\WinRAR\\unrar.exe" -o- x "{ArchivePath}" "{Destination}"\r\n
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

(
echo [Software\ExtractNow]
echo After Extraction Archives Delete=0
echo After Extraction Archives Recycle=0
echo After Extraction Destination Open=0
echo After Extraction Program Clear=0
echo After Extraction Program Close=1
echo After Extraction Program Close If Successful=1
echo After Extraction Program Run=0
echo After Extraction Archives Delete Folder=0
echo After Extraction Archives Move=0
echo After Extraction Archives Recursive=1
echo After Extraction Archives Fate Recursion=1
echo After Extraction Archives Run=0
echo After Extraction Files Delete Broken=0
echo After Extraction Rename Single File=0
echo After Extraction Rename Single File As Folder=0
echo After Extraction Remove Duplicate Folder=0
echo After Extraction Touch Destination=0
echo Destination Overwrite=5
echo Drop Extract Automatically=0
echo Extract To Favorite Folder=1
echo Sounds Off=1
echo Hide Minimize Balloon ToolTip=1
echo Deep Archive Detection=1
echo Mode Test Archives=0
echo Mode Extract Only Unextracted=1
echo Startup Extract Automatically=1
echo Startup Check For Updates=1
echo Startup Minimize To Tray=0
echo Startup Minimize=1
echo Window Stay On Top=0
echo Window Minimize To Tray=0
echo Window Show Default Icons=0
echo Window Allow Multiple Instances=0
echo Window Auto Switch=1
echo Window Log History=0
echo Overwrite Last Option=0
echo Password Use For Entire Archive=0
echo Password Use For Entire Batch=0
echo Password Use List=0
echo Password Use List Prompt=0
echo Password One Per Archive=1
echo Password Timeout=0
echo Password Timeout Seconds=45
echo Directory Extract Automatically=1
echo Search Mask Type=0
echo Thread Priority=2
echo Extract Favorite Folder={ArchiveFolder}\\{ArchiveName}\\
echo Extract Archives Folder={Destination}\\archive\\
echo Window Icon Module=extractnow.icl
echo Window Language=Auto
echo View Extract Auto Scroll=0
echo View Extract Header Count=8
echo View Extract Header 0 Visible=1
echo View Extract Header 0 Width=389
echo View Extract Header 0 Text=File
echo View Extract Header 0 Order=0
echo View Extract Header 1 Visible=1
echo View Extract Header 1 Width=213
echo View Extract Header 1 Text=Status
echo View Extract Header 1 Order=1
echo View Extract Header 2 Visible=1
echo View Extract Header 2 Width=0
echo View Extract Header 2 Text=Progress
echo View Extract Header 2 Order=2
echo View Extract Header 3 Visible=0
echo View Extract Header 3 Width=100
echo View Extract Header 3 Text=Path
echo View Extract Header 3 Order=3
echo View Extract Header 4 Visible=0
echo View Extract Header 4 Width=0
echo View Extract Header 4 Text=Size
echo View Extract Header 4 Order=4
echo View Extract Header 5 Visible=0
echo View Extract Header 5 Width=0
echo View Extract Header 5 Text=Ext
echo View Extract Header 5 Order=5
echo View Extract Header 6 Visible=0
echo View Extract Header 6 Width=0
echo View Extract Header 6 Text=Eta
echo View Extract Header 6 Order=6
echo View Extract Header 7 Visible=0
echo View Extract Header 7 Width=0
echo View Extract Header 7 Text=Elapsed
echo View Extract Header 7 Order=7
echo Window Main Position Left=928
echo Window Main Position Top=803
echo Window Main Position Right=1465
echo Window Main Position Bottom=1096
echo Window Main Position State=1
echo Directory List=%new_path%*\r\n
echo Files Exclude Mask=%extraction_blacklist%
echo Search Mask=%search_blacklist%
echo External Commands=%external_extraction_program%
echo Extract Program To Run=
echo Extract Archives Program To Run=
echo Search Path Last Used=
echo Password List Filename=
)>>%settings_file%

start /wait /b "%title%" %extractnow_install_path% %path%

echo Finished extracting found archives.

echo Waiting %timeout_loop% seconds before rescan directory.

C:\Windows\System32\TIMEOUT.exe /T %timeout_loop%

exit
