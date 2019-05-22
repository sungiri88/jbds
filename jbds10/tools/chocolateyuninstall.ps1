$tools_location = "C:\devstudio"
$filename = 'uninstaller.jar'
if ($tools_location.Contains('/')) { $url = "$tools_location/$filename" }
else { $url = "$tools_location\$filename" }



Install-BinFile -Name JBDS10 -Path java -Command '-jar','$url'