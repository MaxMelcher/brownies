try
{
  Install-ChocolateyVsixPackage 'CKS - Dev for Visual Studio 2012 and 2013' http://visualstudiogallery.msdn.microsoft.com/cf1225b4-aa83-4282-b4c6-34feec8fc5ec/file/96582/4/CKS.Dev11.vsix
  Write-ChocolateySuccess 'CKS - Dev for Visual Studio 2012 and 2013'
} catch {
  Write-ChocolateyFailure 'CKS - Dev for Visual Studio 2012 and 2013' "$($_.Exception.Message)"
  throw 
}




