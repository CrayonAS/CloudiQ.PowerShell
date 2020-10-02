Set-Psrepository psgallery -installationpolicy Trusted
Install-Module -Name Pester -Scope CurrentUser -Confirm:$false
$file = @{
    Uri = "https://github.com/CrayonAS/CloudiQ.PowerShell/archive/master.zip"
    OutFile = 'cloudiq.zip'
}

Invoke-WebRequest @file

Expand-Archive -Path cloudiq.zip -DestinationPath .

Set-Location CloudiQ.PowerShell-master

Invoke-Pester tests -Output Detailed