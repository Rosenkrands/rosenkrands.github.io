cd 'C:\Users\Kasper\Desktop\github_repos\rosenkrands.github.io'

#$dir = [System.IO.Path]::GetDirectoryName($myInvocation.MyCommand.Definition)

$html_basic = 
@"
<!DOCTYPE html>
<html lang = "en">
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-156578046-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-156578046-1');
</script>
<title>Projects</title>
<link rel = 'icon' href="icon.png">
</head>
<a id = "top"><h1>Blackboard</h1></a>
"@

Set-Content -Path .\projects.html -Value $html_basic

$blackboard_folders = get-childitem -Path .\files\blackboard

write-host "The following folders was found"
write-host "-------------------------------"
forEach($f in $blackboard_folders.Name) {
$f
}
write-host "-------------------------------"

Add-content -path .\projects.html -value "<a href = index.html>Home</a>"

ForEach ($f in $blackboard_folders.name) {
    Add-content -path .\projects.html -value "<a href = ""#$f"" rel = ""next"">$f</a>"
}

ForEach ($f in $blackboard_folders.name) {
$semester_heading = "<a id = ""$f""><h1>$f</h1></a>"
Add-Content -Path .\projects.html -value $semester_heading
$courses = Get-ChildItem -Path .\files\blackboard\$f

ForEach ($c in $courses.name) {
Add-content -path .\projects.html -value "<a href = ""#$c"" rel = ""next"">$c</a>"
}
    ForEach ($c in $courses.name) {
    write-host "-------------------------------"
    write-host "Found the course $c from $f"
    $course_heading = "<a id = ""$c""><h2>$c</h2><p></a><a href = ""#top"">top</a></p>"
    Add-content -Path .\projects.html -value $course_heading
    $pictures = Get-ChildItem -path .\files\blackboard\$f\$c   
        ForEach ($p in $pictures.name) {
            $html_picture = "<img src = ""files\blackboard\$f\$c\$p"", width = ""500"">"
            Add-Content -Path .\projects.html -value $html_picture
        }
    write-host "Pictures from ""$c"" have been added"
    write-host "-------------------------------"
    }
}

Add-Content -Path .\projects.html -Value '</html>'

write-host "All done!"