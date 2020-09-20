function Get-CloudiQOrganization {
    <#
    .SYNOPSIS

    Get all organizations that you have access to.

    .DESCRIPTION

    Get all the organizations that are available to you, and presents them as objects. 

    .PARAMETER OrganizationId

    Organization Id, to limit the subscriptions to certain organizations.

    .INPUTS

    

    .OUTPUTS

    Outputs a PSCustomObject.

    .EXAMPLE
    Get-CloudiQSubscription
    .EXAMPLE
    Get-CloudiQSubscription -OrganizationId *******
    #>
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