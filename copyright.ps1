param($target = "D:\\p_work\\api-app-operation")



$header = "/*
*  PA-System
*/"

$headerForProperties = "#
#  (�) 2022 PA-System
#"

$headerForHtml = "<!-- PA-System-->"

function Write-Header ($file) {

    $content = Get-Content $file

    $filename = Split-Path -Leaf $file

    $fileheader = $header -f $filename
    Set-Content $file $fileheader

    Add-Content $file $content
}

function Write-Header-Properties ($file) {

    $content = Get-Content $file

    $filename = Split-Path -Leaf $file

    $fileheader = $headerForProperties -f $filename
    Set-Content $file $fileheader

    Add-Content $file $content
}
function Write-Header-Html ($file) {

    $content = Get-Content $file

    $filename = Split-Path -Leaf $file

    $fileheader = $headerForHtml -f $filename
    Set-Content $file $fileheader

    Add-Content $file $content
}

Get-ChildItem $target -Recurse | ? { $_.Extension -like ".java"}   | % {

    Write-Header $_.PSPath.Split(":",3)[2]
}

Get-ChildItem $target -Recurse | ? { $_.Extension -like ".html"}   | % {

    Write-Header-Html $_.PSPath.Split(":",3)[2]
}

Get-ChildItem $target -Recurse | ? { $_.Extension -like ".properties" -or $_.Extension -like ".yaml" -or $_.Extension -like ".md"}   | % {

        Write-Header-Properties $_.PSPath.Split(":",3)[2]
     
    }
