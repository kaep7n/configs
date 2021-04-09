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

function repos { Set-Location C:\Users\mh\source\repos }

function open-visual-studio() {
    param(
      [string]$RootDirectory = ''
    )
    $solutions = Get-ChildItem -path "$RootDirectory*.sln" 
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
