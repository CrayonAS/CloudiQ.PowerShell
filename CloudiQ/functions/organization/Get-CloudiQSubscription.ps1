function Get-CloudiQSubscription {
    <#
    .SYNOPSIS

    Get all subscriptions.

    .DESCRIPTION

    Get all subscriptions, from all organizations that the user has access to. It's possible to define the organization ID or name to narrow down the results.

    .PARAMETER OrganizationId

    Organization Id, to limit the subscriptions to certain organizations.

    .PARAMETER Name
    Name of the organization you want to see the current subscriptions for.

    .INPUTS

    Can either use the parameters Name or OrganizationId, or pipe any number of OrganizationId to the cmdlet.

    .OUTPUTS

    Outputs a PSCustomObject.

    .EXAMPLE
    Get-CloudiQSubscription

    .EXAMPLE
    Get-CloudiQSubscription -Name Company

    .EXAMPLE
    Get-CloudiQSubscription -OrganizationId *******

    #>
    [CmdletBinding()]
    param (
        [Parameter(Position = 0)]
        [string]
        $Name,
        [Parameter(Position = 1, ValueFromPipeline = $true)]
        [int]
        $OrganizationId
    )

    if ($Name) {
        $OrganizationId = Get-CloudiQOrganization -Name $Name | Select-object -ExpandProperty Id
    }

    $APICall = Invoke-CloudiQApiRequest -Uri "subscriptions/?organizationID=$OrganizationId" -Method Get

    # Declare arrays
    $Publisher = @()
    $Product = @()
    $ProductId = @()
    $Quantity = @()
    $Organization = @()
    #$OrganizationId = @()

    # Add the values to the arrays, for later manipulation
    $APICall | ForEach-Object {
        $Publisher += $_.Publisher.Name
        $Product += $_.Product.ItemName
        $ProductId += $_.Id
        $Quantity += $_.Quantity
        $Organization += $_.Organization.Name
        #$OrganizationId  += $_.Organization.Id
    }
    $row = 0
    $rows = ($Product.Length - 1)
    $results = 0 .. $rows | ForEach-Object {
        [PSCustomObject]@{
            Publisher    = $Publisher[$row]
            Product      = $Product[$row]
            ProductId    = $ProductId[$row]
            Quantity     = $Quantity[$row]
            Organization = $Organization[$row]
            #OrganizationId  = $OrganizationId[$row]
        }
        $row++
    }
    return $results
}