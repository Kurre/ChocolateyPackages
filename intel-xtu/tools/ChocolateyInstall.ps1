$ErrorActionPreference = 'Stop'
$packageName    = 'intel-xtu'
$toolsDir       = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url            = 'https://downloadmirror.intel.com/29183/eng/XTUSetup.exe'
$checksum       = '7CC2ED8102602FB357AEEF9E9FA7785B8F5F548244E4158C0306B559FD08859C'

if (!(Get-Is64))
   {
    Write-Warning "Sorry, Intel® Extreme Tuning Utility is 64 bit only." 
    throw
   }
   
if (Get-IsWinServer)
   {
    Write-Warning "Sorry, Intel® Extreme Tuning Utility is NOT for servers." 
    throw
   }  

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  url           = $url
  silentArgs    = '/quiet /norestart'
  validExitCodes= @(0, 3010)
  softwareName  = 'Intel Extreme Tuning Utility'
  checksum      = $checksum
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
