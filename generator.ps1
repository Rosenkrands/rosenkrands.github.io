cd 'C:\Users\krose\Desktop\GitHub Repos\rosenkrands.github.io'

$dir = [System.IO.Path]::GetDirectoryName($myInvocation.MyCommand.Definition)

$html_basic = 
@"
<!DOCTYPE html>
<html lang = "en">
<head>
<title>Projects</title>
<link rel = 'icon' href="icon.png">
</head>
<a id = "top"><h1>Blackboard</h1></a>
"@

Set-Content -Path .\projects.html -Value $html_basic

$blackboard_folders = get-childitem -Path "$dir\files\blackboard"

ForEach ($f in $blackboard_folders.name) {
    Add-content -path .\projects.html -value "<a href = ""#$f"" rel = ""next"">$f</a>"
}

ForEach ($f in $blackboard_folders.name) {
$semester_heading = "<a id = ""$f""><h1>$f</h1></a>"
Add-Content -Path .\projects.html -value $semester_heading
$courses = Get-ChildItem -Path "$dir\files\blackboard\$f"
ForEach ($c in $courses.name) {
Add-content -path .\projects.html -value "<a href = ""#$c"" rel = ""next"">$c</a>"
}
    ForEach ($c in $courses.name) {
    $course_heading = "<a href = ""#top"">top</a><a id = ""$c""><h2>$c</h2></a>"
    Add-content -Path .\projects.html -value $course_heading
    $pictures = Get-ChildItem -path "$dir\files\blackboard\$f\$c"    
        ForEach ($p in $pictures.name) {
            $html_picture = "<img src = ""files\blackboard\$f\$c\$p"", width = ""500"">"
            Add-Content -Path .\projects.html -value $html_picture
        }
    }
}

Add-Content -Path .\projects.html -Value '</html>'

Get-Content -Path .\projects.html