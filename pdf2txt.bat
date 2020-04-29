goto start
Converting all pdf files in a folder (including subfolders) to txt files.
Based on pdfminer.six
indir：root directory of pdf files, traversing all subfolders
outdir：output directory of txt files
pydir：where pdf2txt.py is located
Directory containing spaces must be enclosed in ""
:start

@echo off
set indir="%USERPROFILE%\Documents\_Reference\Smart Speakers"
set outdir=%USERPROFILE%\Desktop\test\outnew
set pydir=%USERPROFILE%\AppData\Local\Programs\Python\Python37\Scripts

:: Make output directory if not exist
if not exist %outdir% (
    md %outdir%
)

set sum=0
:: Loop through files (recurse subfolders)
for /r %indir% %%F in (*.pdf) do (
    python "%pydir%"\pdf2txt.py -o "%outdir%\%%~nF.txt" "%%F"
    python strip.py "%outdir%\%%~nF.txt"
    echo "%%~nF" converted.
    set /a sum+=1
)

:: Finish
echo %sum% pdf files converted to txt.
pause