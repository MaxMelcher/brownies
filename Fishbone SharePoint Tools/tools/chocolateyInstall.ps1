$packageName = 'CKS - Dev for Visual Studio 2012'

function Get-Batchfile ($file) {
  $cmd = "`"$file`" & set"
    cmd /c $cmd | Foreach-Object {
      $p, $v = $_.split('=')
        Set-Item -path env:$p -value $v
    }
}

function VsVars32() {
  if (!(Test-Path env:VS110COMNTOOLS)) {
    throw "Visual Studio could not be found on this computer. You need to have it installed to install this plugin"
  } else {
    $BatchFile = join-path $env:VS110COMNTOOLS "vsvars32.bat"
    Get-Batchfile `"$BatchFile`"
  }
}

function curlex($url, $filename) {
  $path = [io.path]::gettemppath() + "\" + $filename

    if( test-path $path ) { rm -force $path }

  (new-object net.webclient).DownloadFile($url, $path)

    return new-object io.fileinfo $path
}

function installsilently($url, $name) {
  echo "Installing $name"

  $extension = (curlex $url $name).FullName

  $result = Start-Process -FilePath "VSIXInstaller.exe" -ArgumentList "/q $extension" -Wait -PassThru;
}

try {
  VsVars32
  installsilently http://visualstudiogallery.msdn.microsoft.com/4784e790-32f4-455f-9228-53f537c03787/file/88240/20/FS.Tools.vsix FS.Tools.vsix

   Write-ChocolateySuccess $packageName
} catch {
  Write-ChocolateyFailure $packageName "$($_.Exception.Message)"
  throw
}