# Prompt
Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt pure

# Icons
Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# Fzf -- FIX THIS WHEN YOU GET A CHANCE!!!!!!!
# Import-Module PSFzf
# Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Alias
Set-Alias ll ls
Set-Alias g git
Set-Alias gs 'git status'
Set-Alias tig 'C:\Users\zaynb\scoop\apps\git\2.34.1.windows.1\usr\bin\tig.exe'
Set-Alias less 'C:\Users\zaynb\scoop\apps\git\2.34.1.windows.1\usr\bin\less.exe'

# Utilities
## Which, a function which returns the file location of the provided command
function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
      Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
