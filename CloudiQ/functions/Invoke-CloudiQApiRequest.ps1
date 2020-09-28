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
        $Body,
        [Parameter(Position=3)]
        [switch]
        $AsJson
    )
    try {
        $restSplat = @{
            Uri             = "https://apiv1.crayon.com/api/v1/$Uri"
            Method          = $Method
            Body            = $Body
            ContentType     = 'application/json'
            Authentication  = $CloudIqTokenType
            Token           = ConvertTo-SecureString -String $CloudIqAccessToken -AsPlainText
        }
        $result = Invoke-RestMethod @restSplat -ErrorAction Stop
    }
    catch {
        Write-Error "Not able to connect to Cloud-iQ. Have you run the Connect-CloudiQ cmdlet?"
    }

    if ($AsJson) {
        $result | ConvertTo-Json
    }
    else {
        $result
    }
}