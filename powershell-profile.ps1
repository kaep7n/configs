if($env:WT_SESSION -and $env:TERM_PROGRAM -ne 'vscode')
{
    write-host "Import-Module DockerCompletion"
    Import-Module DockerCompletion
    write-host "Import-Module Terminal-Icons"
    Import-Module -Name Terminal-Icons
    write-host "Import-Module oh-my-posh"
    Import-Module oh-my-posh
    write-host "Set-Theme ~/.oh-my-posh.omp.json"
    Set-PoshPrompt -Theme  ~/.oh-my-posh.omp.json
}

write-host "Import-Module posh-git"
Import-Module posh-git

Import-Module z

function src { Set-Location C:\Users\mh\source }

function open-visual-studio() {
  param(
      [string]$path = './'
    )
    $solutions = Get-Childitem -Filter "$path*.sln"

    $solutions | ForEach-Object { write-host " - $($_)" }

    if ($solutions.Count -eq 1) {
      & $solutions.FullName
    }
    elseif ($solutions.Count -eq 0) {
      write-host "no solutions found"
    }
    elseif ($solutions.Count -gt 1) {
      write-host "found more than one solution"
    }
  }
  
Set-Alias vs open-visual-studio
