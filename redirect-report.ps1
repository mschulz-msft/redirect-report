

param (
    [string]$sourceurl = "https://msdn.microsoft.com/",
    [string]$targeturl = "https://msdn.microsoft.com/"
    )



#$source=get-content  ./report.txt | select -skip 1 | %{"$( echo "https://msdn.microsoft.com/en-us/" $_.Split()[2,1])"}
$source=get-content  ./report.txt | select -skip 1 | %{"$( echo $sourceurl $_.Split()[2,1])"}
$file1 = $source -replace (' ')

#$target=get-content  ./report.txt | select -skip 1 | %{"$( echo "https://msdn.microsoft.com/en-us/azure/data-lake-analytics/u-sql/" $_.Split()[2,0])"}
$target=get-content  ./report.txt | select -skip 1 | %{"$( echo $targeturl $_.Split()[2,0])"}
$file2 = $target -replace (' ')


#$file1 = $report -replace (' ')
#$file2 = "target.txt"
$locale = "en-us"
$family = "Azure"
$version = "100"
$outputFile = "export.csv"
 
#$file1String = Get-content -path $file1
#$file2String = Get-content $file2

'Locale,Source URL,Product Version,Product Family,Target URL' > $outputFile


$counter = 0
while(($file1[$counter] -ne $null) -and ($file2[$counter] -ne $null)){
    $Line = $locale + "," + $file1[$counter] + "," + $version + "," + $family + "," + $file2[$counter]
    $line >> $outputFile
    $counter++
}














