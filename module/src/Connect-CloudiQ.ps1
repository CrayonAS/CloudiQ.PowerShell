function Connect-CloudiQ {
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
        'username'=$username
        'password'=$password | ConvertFrom-SecureString -AsPlainText
        'grant_type'="password"
        'scope'="CustomerApi"
    }
    
    $headers.Add("Authorization", "Basic "+$EncodedText)
    $headers.Add("Content-Type", "application/x-www-form-urlencoded")
    
    $OAuthReq = Invoke-RestMethod -Method Post -Uri $apiBaseUrl/connect/token -Body $Body -Headers $headers
    
    New-Variable -Name tokenType -Value $OAuthReq.tokentype -Scope Global -Force
    New-Variable -Name AccessToken -Value $OAuthReq.accesstoken -Scope Global -Force
}