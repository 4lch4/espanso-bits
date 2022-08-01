$Packages = @{
  'twitch'          = '4lch4/twitch'
  'noc-engineering' = 'jbh/noc-engineering'
  'general'         = '4lch4/general'
}

function Get-PackagePath {
  return espanso path packages
}

function Install-SnippetPackage {
  [CmdletBinding()]
  param (
    [Parameter(Position = 0)]
    [System.String]
    $PackageName
  )
  
  $PackageDir = Join-Path $env:PWD $Packages[$PackageName]
  $InstallDir = $(espanso path packages)

  Copy-Item -Recurse -Path $PackageDir -Destination $InstallDir

  # if (Test-Path $PackageDir) {
  #   Write-Host "$PackageDir exists, installing now."
  # }
  # if ($null -ne $Packages[$PackageName]) {
  #   Write-Host $Packages[$PackageName]
  # }

}


# $PackageDir = Join-Path "." $PackageName