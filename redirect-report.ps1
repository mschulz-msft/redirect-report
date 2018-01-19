

param (
    [string]$sourcefile,
    [string]$outfile,
    [string]$sourceurl = "https://msdn.microsoft.com/",
    [string]$targeturl = "https://msdn.microsoft.com/"
    )



$source=get-content  $sourcefile | select -skip 1 | %{"$( echo $sourceurl $_.Split()[2,1])"}
$file1 = $source -replace (' ')

$target=get-content  $sourcefile | select -skip 1 | %{"$( echo $targeturl $_.Split()[2,0])"}
$file2 = $target -replace (' ')


$locale = "en-us"
$family = "Azure"
$version = "100"
 

'Locale,Source URL,Product Version,Product Family,Target URL' > $outputFile


$counter = 0
while(($file1[$counter] -ne $null) -and ($file2[$counter] -ne $null)){
    $Line = $locale + "," + $file1[$counter] + "," + $version + "," + $family + "," + $file2[$counter] -replace ('.md')
    $line >> $outfile
    $counter++
}














