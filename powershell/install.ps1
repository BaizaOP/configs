$new_deps = New-Object System.IO.StreamReader{C:\Users\zaynb\repos\configs\powershell\scoop_deps.txt}
$new_deps_list = @()
while (($cur_line = $new_deps.ReadLine()) -ne $null){
    $new_deps_list += $cur_line
}
$new_deps.close()

$install_list = @()

$has_cur_deps =  Test-Path -Type leaf -Path "C:\Users\zaynb\repos\configs\powershell\current_deps.txt"
if($has_cur_deps -ne $false) {
    $cur_deps = New-Object System.IO.StreamReader{C:\Users\zaynb\repos\configs\powershell\current_deps.txt}
    $cur_deps_list = @()
    while (($cur_line = $cur_deps.ReadLine()) -ne $null){
        $cur_deps_list += $cur_line
    }
    $cur_deps.close()
    foreach ($new in $new_deps_list) {
        $in = $false
            foreach ($cur in $cur_deps_list) {
                echo ($cur + " " + $new)
                if($new -eq $cur) {
                    $in = $true
                }
            }
        if($in -eq $false) {
            $install_list += $new
        }
    }
    Clear-Content C:\Users\zaynb\repos\configs\powershell\current_deps.txt 
} else {
    New-Item -Path . -Name "current_deps.txt" -ItemType "file"
    $install_list = $new_deps_list
}

# should happen regardless
foreach($item in $new_deps_list) { 
    Add-Content C:\Users\zaynb\repos\configs\powershell\current_deps.txt $item
}

foreach($item in $install_list) {
    echo $item
    scoop install $item
}

