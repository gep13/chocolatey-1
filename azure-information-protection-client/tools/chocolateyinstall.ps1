﻿
$ErrorActionPreference = 'Stop';

$packageName= $env:ChocolateyPackageName
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://download.microsoft.com/download/4/9/1/491251F7-46BA-46EC-B2B5-099155DD3C27/AZInfoProtection_MSI_for_central_deployment.msi'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  softwareName  = 'azure-information-protection-client'

  checksum      = '759002FF5B7EF739828B786BE95ECC3A78205BC7DE22CBB98379C0212B366167'
  checksumType  = 'sha256'
  checksum64    = '759002FF5B7EF739828B786BE95ECC3A78205BC7DE22CBB98379C0212B366167'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
