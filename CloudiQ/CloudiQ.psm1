# ------------- Cloud-iQ ------------- #
# Dot sourcing all available functions #
# $functionTypes = @(
#     '/'
#     '/organization/'
# )

# foreach ($function in $functionTypes) {
#     Get-ChildItem -Name "*.ps1" -Path ($PSScriptRoot + "/functions" + $function) | ForEach-Object {
#         . ($PSScriptRoot + "/functions" + $function + $_)
#     }
# }

Get-ChildItem -Path ($PSScriptRoot + "/functions") -Recurse -File | ForEach-Object {
    . $_
}