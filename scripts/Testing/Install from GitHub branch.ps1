$branch = "rs/issue10"

Set-PSRepository PSGallery -InstallationPolicy Trusted
Install-Module -Name Pester -Scope CurrentUser -Confirm:$false
$file = @{
    Uri = "https://github.com/CrayonAS/CloudiQ.PowerShell/archive/$branch.zip"
    OutFile = 'cloudiq.zip'
}

Invoke-WebRequest @file

Expand-Archive -Path cloudiq.zip -DestinationPath .

Set-Location CloudiQ.PowerShell*

Invoke-Pester tests -Output Detailed

Import-Module .\CloudiQ\CloudiQ.psd1