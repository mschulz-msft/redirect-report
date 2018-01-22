

<#

.SYNOPSIS 

This script converts a tab delimited file from the migration report to the correct input template for URL redirection.

Usage: redirect-report.ps1 [-sourcefile] <String> [-outfile] <String> [-sourceurl] <String> [-targeturl] <String> [-prodfam] <String> [-version] <String> [-locale]
    <String> [<CommonParameters>]

Example: redirect-report.ps1 -sourcefile report.txt -outfile urlredirecttemplate.csv -sourceurl https://msdn.microsoft.com/ -targeturl https://docs.microsoft.com/en-us/powershell/ -prodfam Azure -version 100 -locale en-us

.PARAMETER sourcefile

.DESCRIPTION

The input file has to be a tab delimited text file which can be exported from the Excel workbook of the migration report.
Once the file is saved as a regular text file it can be used as the sourcefile for conversion.

sourecefile: the tab delimted text file exported from Excel
outfile: the redirect template file
sourceurl: original URL head to be used
targeturl: target URL head to be redirected to
prodfam: product family
version: product version
locale: locale of target URL

#>





  
param (
    [Parameter(Mandatory=$True)][AllowEmptyString()][string]$sourcefile,
    [Parameter(Mandatory=$True)][AllowEmptyString()][string]$outfile,
    [Parameter(Mandatory=$True)][AllowEmptyString()][string]$sourceurl,
    [Parameter(Mandatory=$True)][AllowEmptyString()][string]$targeturl,
    [Parameter(Mandatory=$True)][AllowEmptyString()][string]$prodfam,
    [Parameter(Mandatory=$True)][AllowEmptyString()][string]$version,
    [Parameter(Mandatory=$True)][AllowEmptyString()][string]$locale
           
)
       
 

$source=get-content  $sourcefile | select -skip 1 | %{"$( echo $sourceurl $_.Split()[2,1])"}
$file1 = $source -replace (' ')

$target=get-content  $sourcefile | select -skip 1 | %{"$( echo $targeturl $_.Split()[2,0])"}
$file2 = $target -replace (' ')


'Locale,Source URL,Product Version,Product Family,Target URL' > $outfile


$counter = 0
while(($file1[$counter] -ne $null) -and ($file2[$counter] -ne $null)){
    $Line = $locale + "," + $file1[$counter] + "," + $version + "," + $prodfam + "," + $file2[$counter] -replace ('.md')
    $line >> $outfile
    $counter++
}














