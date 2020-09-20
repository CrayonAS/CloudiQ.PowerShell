Get-ChildItem -Path ($PSScriptRoot + "/functions") -Recurse -File | ForEach-Object {
    . $_
}