function Get-CloudiQSubscription {
    [CmdletBinding()]
    param (
        [Parameter()]
        [int]
        $OrganizationId
    )
    $APICall = Invoke-CloudiQApiRequest -Uri "subscriptions/?organizationID=$OrganizationId" -Method Get
    
    $APICall | ForEach-Object {
        [PSCustomObject]@{
            Publisher       = $_.Publisher.Name
            Product         = $_.Product.ItemName
            ProductId       = $_.Id
            Organization    = $_.Organization.Name
            OrganizationId  = $_.Organization.Id
        } | Format-Table
    }
}