$OldData = "C:\xampp\mysql\data_$(Get-Date -Format "yyyyMMdd")"
$Data = "C:\xampp\mysql\data"
$Ignore = "mysql","performance_schema","phpmyadmin","test"

Move-Item $Data $OldData
Copy-Item -Recurse C:\xampp\mysql\backup $Data

$SubFolders = Get-ChildItem -Path $OldData -Directory
ForEach($d in $SubFolders) {
    if($Ignore -Contains $d.Name) {
        Write-Output "Skip "$d.FullName
    } else {
        Write-Output "Copy "$d.FullName
        Copy-Item -Recurse $d.FullName $Data
    }
}

Copy-Item $OldData\ib_logfile0 $Data
Copy-Item $OldData\ib_logfile1 $Data
Copy-Item $OldData\ibdata1 $Data

