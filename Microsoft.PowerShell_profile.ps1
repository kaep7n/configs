Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Paradox

function repos { Set-Location C:\Users\kaept\source\repos }
function vyr { Set-Location C:\Users\kaept\source\repos\kaep7n\vyr }
function bifröst { Set-Location C:\Users\kaept\source\repos\kaep7n\bifr-st }

function open-visual-studio() {
    param(
      [string]$RootDirectory = ''
    )
    $solutions = Get-ChildItem -recurse -path "$RootDirectory*.sln"
    if ($solutions.Count -eq 1) {
      & $solutions.FullName
    }
    elseif ($solutions.Count -eq 0) {
      write-host "I couldn't find any solution files here!"
    }
    elseif ($solutions.Count -gt 1) {
      write-host "I found more than solution. Which one do you want to open?"
      $solutions | ForEach-Object { write-host " - $($_.FullName)" }
    }
  }
  
  Set-Alias vs open-visual-studio