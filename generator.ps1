cd 'C:\Users\krose\Desktop\PowerShell for html generation'

$pictures = Get-ChildItem -Path .\ -Filter *.jpg

$html_basic = 
@"
<!DOCTYPE html>
<html lang = "en">
<head>
<title>Projects</title>
<link rel = 'icon' href="icon.png">
</head>
<h1>Here are some pictures!</h1>
"@

Set-Content -Path .\projects.html -Value $html_basic 

ForEach ($p in $pictures.name) {
    $html_picture = "<img src = ""$p"", width = ""500"">"
    Add-Content -Path .\projects.html -value $html_picture
}

Add-Content -Path .\projects.html -Value '</html>'

Get-Content -Path .\projects.html