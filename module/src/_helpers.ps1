function Invoke-CloudiQApiRequest {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$True, Position=0)]
        [string]
        $Uri,
        [Parameter(Position=1)]
        [string]
        $Method = "Get",
        [Parameter(Position=2)]
        [string]
        $Body
    )
    try {
        $restSplat = @{
            Uri    = "https://apiv1.crayon.com/api/v1/$Uri"
            Method = $Method
            Body   = $Body
            Authentication = $TokenType
            Token = ConvertTo-SecureString -String $AccessToken -AsPlainText
        }
        Invoke-RestMethod @restSplat | Select-Object -ExpandProperty Items -ErrorAction Stop
    }
    catch {
        Write-Error "Not able to connect to Cloud-iQ. Have you run the Connect-CloudiQ cmdlet?"
    }
}