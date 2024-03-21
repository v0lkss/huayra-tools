iwr -useb https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.ps1 | iex
spicetify config custom_apps lyrics-plus
spicetify config extensions fullAppDisplay.js
spicetify config extensions loopyLoop.js
$confirmation = Read-Host "Quieres instalar el tema Nord? [Y/n]"
if ($confirmation -eq "n" -or $confirmation -eq "N") {
    Write-Host "Instalacion Finalizada"
} else {
    Invoke-WebRequest -Uri "https://github.com/v0lkss/witane/spicetify-themes.zip" -OutFile "$env:AppData\spicetify\Themes\spicetify-themes.zip"
    Expand-Archive -Path "$env:AppData\spicetify\Themes\spicetify-themes.zip" -DestinationPath "$env:AppData\spicetify\Themes\spicetify-themes"
    mv "$env:AppData\spicetify\spicetify-themes\*" "$env:AppData\spicetify\"
    spicetify config current_theme Sleek
    spicetify config color_scheme Nord
}
spicetify apply
