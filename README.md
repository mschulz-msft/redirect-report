## Redirect report generator 


This script converts a tab delimited file from the migration report to the correct input template for URL redirection.

Usage: redirect-report.ps1 [-sourcefile] <String> [-outfile] <String> [-sourceurl] <String> [-targeturl] <String> [-prodfam] <String> [-version] <String> [-locale]
    <String>

Example: redirect-report.ps1 -sourcefile report.txt -outfile urlredirecttemplate.csv -sourceurl https://msdn.microsoft.com/ -targeturl https://docs.microsoft.com/en-us/powershell/ -prodfam Azure -version 100 -locale en-us


The input file has to be a tab delimited text file which can be exported from the Excel workbook of the migration report. Once the file is saved as a regular text file it can be used as the sourcefile for conversion.

```sourecefile: the tab delimted text file exported from Excel
outfile: the redirect template file
sourceurl: original URL head to be used
targeturl: target URL head to be redirected to
prodfam: product family
version: product version
locale: locale of target URL


