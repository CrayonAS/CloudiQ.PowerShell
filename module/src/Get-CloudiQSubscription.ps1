function Get-CloudiQSubscription {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $OrganizationId
    )
    $APICall = Invoke-CloudiQApiRequest -Uri "subscriptions/?organizationID=$OrganizationId" -Method Get
    
    $APICall | ForEach-Object {
        [PSCustomObject]@{
            Organization = $_.Organization.Name
            OrganizationId = $_.Organization.Id
        }
    }
}