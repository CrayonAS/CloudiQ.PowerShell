function Get-CloudiQSubscription {
    <#
    .SYNOPSIS

    Get all available subscriptions.

    .DESCRIPTION

    Get all available subscriptions, from all organizations that one has access to.

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
        [Parameter(Position = 0, ValueFromPipeline = $true)]
        [int]
        $OrganizationId
    )

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