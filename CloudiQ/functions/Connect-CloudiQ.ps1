function Connect-CloudiQ {
    <#
    .SYNOPSIS

    Connect to CloudiQ and adds API token to your session.

    .DESCRIPTION

    Connect to CloudiQ by using a client id and secret created in the portal, as well as your username and password.

    .PARAMETER ClientId

    Client Id from the portal, created under API Management

    .PARAMETER ClientSecret

    Client Secret from the portal, created under API Management

    .INPUTS

    .OUTPUTS

    No output, adds API token to your current session.

    .EXAMPLE
    Connect-CloudiQ -ClientId xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx -ClientSecret xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
    #>
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $ClientId,
        [Parameter()]
        [string]
        $ClientSecret
    )
    
    $apiBaseUrl = 'https://api.crayon.com/api/v1'
    
    $headers = @{}
    $encodedClientId = [System.Web.HttpUtility]::UrlEncode($clientId) 
    $encodedSecret = [System.Web.HttpUtility]::UrlEncode($clientSecret) 
    $credentials = "$($encodedClientId):$($encodedSecret)"
    $Bytes = [System.Text.Encoding]::UTF8.GetBytes($credentials)
    $EncodedText =[Convert]::ToBase64String($Bytes)
    
    $username = Read-Host -Prompt "Username"
    $password = Read-Host -Prompt "Password" -AsSecureString
    
    $Body = @{
        'username'= $username
        'password'= $password | ConvertFrom-SecureString -AsPlainText
        'grant_type'="password"
        'scope'="CustomerApi"
    }
    
    $headers.Add("Authorization", "Basic "+$EncodedText)
    $headers.Add("Content-Type", "application/x-www-form-urlencoded")
    
    $OAuthReq = Invoke-RestMethod -Method Post -Uri $apiBaseUrl/connect/token/ -Body $Body -Headers $headers
    
    New-Variable -Name CloudIqTokenType -Value $OAuthReq.tokentype -Scope Global -Force
    New-Variable -Name CloudIqAccessToken -Value $OAuthReq.accesstoken -Scope Global -Force
}