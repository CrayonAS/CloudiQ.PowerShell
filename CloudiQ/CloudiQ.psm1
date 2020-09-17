Get-ChildItem -Path ($PSScriptRoot + "/src") | ForEach-Object {
    . $_
}