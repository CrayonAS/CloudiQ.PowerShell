# ------------- Cloud-iQ ------------- #
# Dot sourcing all available functions #
Get-ChildItem -Path ($PSScriptRoot + "/functions") -Recurse -File | ForEach-Object {
    . $_
}
