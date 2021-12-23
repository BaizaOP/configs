This configuration was made by watching this video: [https://www.youtube.com/watch?v=5-aK2_WwrmM](https://www.youtube.com/watch?v=5-aK2_WwrmM)

# What is included
- Windows Terminal
- Powershell
- Scoop
- Oh-My-Posh + Posh-Git
- Terminal Icons, z (fancy cd), Powershell Autocompletion, and fzf (fuzzy file finder)
- Git

### Todo
- make a broader installation script to get rid of most of these steps

# How to get this up and running


### Step 1. Get the components
1. From the Microsoft Store, download Windows Terminal and the newest version of PowerShell

2. Run this command to get Scoop
```Powershell
iwr -useb get.scoop.sh | iex
```
3. Get all deps by running
```Powershell
powershell -ExecutionPolicy Unrestricted -command ".\install.ps1"
```
### Step 2. Get Git
I never thought I would have to do it this way, but Scoop is being a butt rn so yeah.
4. Install Git via Winget using the command
```Powershell
winget install -e --id Git.Git
```
5. Follow all of the prompts given by Powershell and the Git popup

### Step 3. Windows Terminal (wt) setup
6. Download the Hack Nerd Font (or other similar font) at [https://github.com/ryanoasis/nerd-fonts](https://github.com/ryanoasis/nerd-fonts)

7. Symlink the settings file in this folder to the settings.json file by running this command in _ADMIN_ mode (fix this, hardlinks prolly aren't the way to go)
```Powershell
del $env:LocalAppData\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json; New-Item -Path $env:LocalAppData\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json -Type HardLink -Target C:\Users\zaynb\repos\configs\powershell\settings.json
```
>Note: all symlinks need to be in admin mode

### Step 4. Copy the configuration files in
8. Make this folder `$Home\.config\powershell\user_profile.ps1`, then symlink the `user_profile.ps1` with
```Powershell
New-Item -Path $Home\.config\powershell\user_profile.ps1 -Type SymbolicLink -Target C:\users\zaynb\repos\config\powershell\user_profile.ps1
```
9. Copy the `Microsoft.PowerShell_profile.ps1` file to where `$PROFILE.CurrentUserCurrentHost` is (no symlink needed as this won't change)
You may need to reload again to see changes.

### Step 5. Oh-My-Posh + Posh-Git
10. To install both, just run
```Powershell
Install-Module posh-git -Scope CurrentUser -Force; Install-Module oh-my-posh -Scopre CurrentUser -Force
```

### Step 6. Further Terminal Customization
11. To get Terminal Icons, run
```Powershell
Install-Module -Name Terminal-Icons -Repository -Force
```
12. To get z (a smarter cd command), run
```Powershell
Install-Module -Name z -Force
```
13. To get autocompletion via PSReadLine, run
```Powershell
Install-Module -Name PSReadLine -RequiredVersion 2.2.0-beta4 -AllowPrerelease
```
14. To get Fxf (fuzzy file finder), run
```Powershell
Install-Module -Name PSFzf -Scope CurrentUser -Force
```
