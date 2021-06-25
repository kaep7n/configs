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

Import-Module z

function repos { Set-Location C:\Users\kaept\source }

function open-visual-studio() {
    $solutions = Get-Childitem -Path .\ -Filter *.sln -Exclude src* -Recurse -File -Name
    if ($solutions.Count -eq 1) {
      & $solutions
    }
    elseif ($solutions.Count -eq 0) {
      write-host "no solutions found"
    }
    elseif ($solutions.Count -gt 1) {
      write-host "found more than one solution"
      $solutions | ForEach-Object { write-host " - $($_)" }
    }
  }
  
  Set-Alias vs open-visual-studio
