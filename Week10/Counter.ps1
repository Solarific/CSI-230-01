cd "C:\Users\roflw\CSI-230-01" #my personal directory to access bash files :)

$filesToLookAt = Get-ChildItem -Recurse -filter "*.bash"

$minLineCount = [int]::MaxValue 
$minWordCount = [int]::MaxValue 

$maxLineCount = 0
$maxWordCount = 0

$averageLineCount = 0 
$averageWordCount = 0

$totalLineCount = 0
$totalLineCount = 0

for ($i=0; $i -lt $filesToLookAt.length; $i++ ) {

$lineCount = (Get-Content $filesToLookAt[$i].FullName -Raw | Measure-Object -Line).Lines
$wordCount = (Get-Content $filesToLookAt[$i].FullName -Raw | Measure-Object -Word).Words

if ( $lineCount -lt $minLineCount ){ $minLineCount = $lineCount }
if ( $wordCount -lt $minWordCount ){ $minWordCount = $wordCount }

if ( $lineCount -gt $maxLineCount ){ $maxLineCount = $lineCount }
if ( $wordCount -gt $maxWordCount ){ $maxWordCount = $wordCount }

$totalLineCount += $lineCount;
$totalWordCount += $wordCount;

}

$averageLineCount = $totalLineCount / $filesToLookAt.length;
$averageWordCount = $totalWordCount / $filesToLookAt.length;

Write-Host "Minimum Line Count: $minLineCount"
Write-Host "Minimum Word Count: $minWordCount"
Write-Host "Maximum Line Count: $maxLineCount"
Write-Host "Maximum Word Count: $maxWordCount"
Write-Host "Average Line Count: $averageLineCount"
Write-Host "Average Word Count: $averageWordCount"