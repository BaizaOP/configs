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

### Step 2. Windows Terminal (wt) setup
4. Download the Hack Nerd Font (or other similar font) at [https://github.com/ryanoasis/nerd-fonts](https://github.com/ryanoasis/nerd-fonts)

5. Symlink the settings file in this folder to the settings.json file by running this command in _ADMIN_ mode (fix this, hardlinks prolly aren't the way to go)
```Powershell
del $env:LocalAppData\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json; New-Item -Path $env:LocalAppData\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json -Type HardLink -Target C:\Users\zaynb\repos\configs\powershell\settings.json
```
>Note: all symlinks need to be in admin mode

### Step 3. Copy the configuration files in
6. Make this folder `$Home\.config\powershell\user_profile.ps1`, then symlink the `user_profile.ps1` with
```Powershell
New-Item -Path $Home\.config\powershell\user_profile.ps1 -Type SymbolicLink -Target C:\users\zaynb\repos\config\powershell\user_profile.ps1
```
6. Copy the `Microsoft.PowerShell_profile.ps1` file to where `$PROFILE.CurrentUserCurrentHost` is (no symlink needed as this won't change)
You may need to reload again to see changes.

### Step 4. Oh-My-Posh + Posh-Git
7. To install both, just run
```Powershell
Install-Module posh-git -Scope CurrentUser -Force; Install-Module oh-my-posh -Scopre CurrentUser -Force
```
