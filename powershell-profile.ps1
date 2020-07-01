if($env:WT_SESSION -and $env:TERM_PROGRAM -ne 'vscode')
{
    write-host "Import-Module DockerCompletion"
    Import-Module DockerCompletion
    write-host "Import-Module posh-git"
    Import-Module posh-git
    write-host "Import-Module oh-my-posh"
    Import-Module oh-my-posh
    write-host "Set-Theme Paradox"
    Set-Theme Paradox
}

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
