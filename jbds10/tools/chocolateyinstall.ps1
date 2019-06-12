$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition
$jarPath = Join-Path -Path $toolsDir -ChildPath 'devstudio-10.0.0.GA-installer-standalone.jar'

$validExitCodes = @(0,21)

$installXml = Join-Path -Path $toolsDir -ChildPath 'InstallConfigRecord.xml'

$driveLetters= (Get-Volume).DriveLetter

if ($driveLetters -contains "D")
{
[xml]$xml = Get-Content $installXml
Write $xml.AutomatedInstallation.'com.jboss.devstudio.core.installer.PathInputPanel'.installpath
$element =  $xml.SelectSingleNode("//installpath")
Write $element
$element.'#text'="D:\devstudio"
$xml.Save("$installXml")
}

$installArgs = "java -jar $($jarPath) $($installXml)"
 
try {
 
 
  Start-ChocolateyProcessAsAdmin -Statements "$installArgs" `
                                 -ExeToRun "powershell" `
                                 -ValidExitCodes $validExitCodes
} catch {
  throw
}
