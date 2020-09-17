function Get-CloudiQOrganization {
    [CmdletBinding()]
    param (
        [Parameter(Position=0)]
        [string]
        $Name
    )
    $APICall = Invoke-CloudiQApiRequest -Uri ("organizations/?search="+$name)
    $APICall | ForEach-Object {
        [PSCustomObject]@{
            Name            = $_.Name
            CustomerId      = $_.Id
            ParentId        = $_.ParentId
            AccountNumber   = $_.AccountNumber
        }
    }
}