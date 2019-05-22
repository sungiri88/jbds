$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition
$jarPath = Join-Path -Path $toolsDir -ChildPath 'devstudio-10.0.0.GA-installer-standalone.jar'

$validExitCodes = @(0,21)

$installXml = Join-Path -Path $toolsDir -ChildPath 'InstallConfigRecord.xml'
$installArgs = "java -jar $($jarPath) $($installXml)"
 
try {
 
 
  Start-ChocolateyProcessAsAdmin -Statements "$installArgs" `
                                 -ExeToRun "powershell" `
                                 -ValidExitCodes $validExitCodes
} catch {
  throw
}