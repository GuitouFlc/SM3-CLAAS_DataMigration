Write-host "You must launch this script from the new computer" -ForegroundColor red -BackgroundColor white
Write-Host "in step 2, you need to enter the name of the old computer or his IP Adress" -ForegroundColor red -BackgroundColor white
Write-Host "all computers need to be connected in the same network" -ForegroundColor red -BackgroundColor white
Pause

$user = $env:USERNAME
$exPC = Read-Host "nom de l ancien pc ex : PCD1234"
$bkupFolder = @("Desktop","Contacts", "Documents","Favorites","Images","Music", "Downloads", "Videos")
$source = "\\$exPC\c$\Users\$user\$Folder"
$destination = "C:\Users\" + $user

foreach ($Folder in $bkupFolder) {
    robocopy $source $destination /E /R:2 /W:5 /ETA
}

Write-Host "Les donnees ont ete copiees"