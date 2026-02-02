function dev { Set-Location C:\dev }

function open-visual-studio() {
  param(
      [string]$path = './'
    )
    $solutions = Get-ChildItem -Path $path -Include "*.sln", "*.slnx" -Recurse -ErrorAction SilentlyContinue

    if ($solutions.Count -eq 0) {
      write-host "no solutions found"
    }
    elseif ($solutions.Count -eq 1) {
      & $solutions.FullName
    }
    else {
      write-host "found more than one solution:"
      for ($i = 0; $i -lt $solutions.Count; $i++) {
        write-host " [$($i+1)] $($solutions[$i].FullName)"
      }
      $selection = Read-Host "Select a solution (1-$($solutions.Count))"
      if ($selection -match '^\d+$' -and [int]$selection -ge 1 -and [int]$selection -le $solutions.Count) {
        & $solutions[[int]$selection - 1].FullName
      } else {
        write-host "Invalid selection"
      }
    }
  }
  
Set-Alias vs open-visual-studio
Set-Alias code code-insiders
Set-Alias c code-insiders
Set-Alias x explorer

Import-Module z
Import-Module -Name Terminal-Icons
Import-Module posh-git

Invoke-Expression (&starship init powershell)