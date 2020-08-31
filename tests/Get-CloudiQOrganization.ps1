BeforeAll {
    # Import module
    Import-Module -Name "$PSScriptRoot/../module/Cloud-iQ.PowerShell.psd1" -Force -ErrorAction Stop
    Get-Content -Path "$PSScriptRoot/_mocks/organizations.ps1"
}

Describe 'Test Get-CloudiQOrganization' {
    It 'Should result in listing four demo customers' {
        

        $Organizations = Get-CloudiQOrganization

        $Organizations.count | Should -be 4
    }
}