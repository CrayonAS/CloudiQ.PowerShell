function Invoke-CloudiQApiRequest {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$True, Position=0)]
        [string]
        $Uri,
        [Parameter(Mandatory=$True, Position=1)]
        [string]
        $Method
    )
    try {
        $restSplat = @{
            Method = $Method
            Uri    = "https://api.crayon.com/api/v1/$Uri"
            Authentication = $TokenType
            Token = ConvertTo-SecureString -String $AccessToken -AsPlainText
        }
        Invoke-RestMethod @restSplat | Select-Object -ExpandProperty Items -ErrorAction Stop
    }
    catch {
        Write-Error "Not able to connect to Cloud-iQ. Have you run the Connect-CloudiQ cmdlet?"
    }
}