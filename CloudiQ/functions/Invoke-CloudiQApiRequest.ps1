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
    catch [System.Net.WebException] {
        Write-Error $_.Exception.Message
        Write-Warning "Not able to connect to Cloud-iQ. Have you run the Connect-CloudiQ cmdlet?"
    }
    catch {
        if ($_.Exception.Message -eq "Cannot bind argument to parameter 'String' because it is null.") {
            Write-Error $_.Exception.Message
            Write-Warning "There are no access token set. Please run Connect-CloudiQ and log in with your API client ID and secret, as well as username and password."
            break
        }
    }

    if ($AsJson) {
        $result | ConvertTo-Json
    }
    else {
        $result
    }
}