function Set-CloudiQSubscription {
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
        [Parameter(Position = 0, ValueFromPipeline = $true)]
        [string]
        $SubscriptionId,
        [Parameter(Position = 1)]
        [int]
        $Add,
        [Parameter(Position = 2)]
        [int]
        $Subtract,
        [Parameter(Position = 1)]
        [int]
        $Quantity
    )
    $subscription = Invoke-CloudiQApiRequest -Uri ("subscriptions/$SubscriptionId/") -Method 'GET'

    $originalQuantity = $subscription.quantity
    
    if ($Add) {
        $subscription.quantity += $Add
    }
    elseif ($Subtract) {
        $subscription.quantity -= $Subtract
    }
    else {
        $subscription.quantity = $Quantity
    }

    $APICall = Invoke-CloudiQApiRequest -Uri ("subscriptions/$SubscriptionId/") -Method 'PUT' -Body ($subscription | ConvertTo-Json)

    [PSCustomObject]@{
        Name        = $APICall.name
        Id          = $APICall.Id
        Quantity    = $APICall.Quantity
    }
}