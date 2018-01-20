## Redirect report generator 

Accepts a tab delimited input file from the migration report and creates the input file for the 
URL redirect request.

Usage: redirect-report.ps1 -sourefile `<inputfile>` -outfile `<outputfile>` -sourceurl `<sourceurlhead>` -targeturl `<targeturlhead>`

Example: ./redirect-report.ps1 -sourcefile report.csv -outfile report-export.csv -sourceurl `https://msdn.microsoft.com` -targeturl `https://msdn.microsoft.com/azure/aks`

Locales are currently ignored
