# rosenkrands.github.io
The purpose of this website is to gather pictures of exercises from courses during my studies at Aalborg University.

# Set-up
At this point the core of the website is composed of projects.html, this html document is generated using the Powershell script called generator.ps1.

# generator.ps1
In a nutshell the script looks for sub paths of the path .\files\blackboard.
For each sub path (which correspond to a semester) the scripts writes a heading to the html document, then the scripts looks for sub paths within each semester folder (which correspond to a course) and then for each image in this, path inserts this picture to the html document.
