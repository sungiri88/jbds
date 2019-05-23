$ErrorActionPreference = 'Stop'
$jarPath ="C:\devstudio\uninstaller.jar"

$validExitCodes = @(0,21)
$installArgs = "java -jar $($jarPath)"
 
try {
  Start-ChocolateyProcessAsAdmin -Statements "$installArgs" `
                                 -ExeToRun "powershell" `
                                 -ValidExitCodes $validExitCodes
} catch {
  throw
}
