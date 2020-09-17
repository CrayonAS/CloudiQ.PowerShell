BeforeAll {
    # Import module
    Import-Module -Name "$PSScriptRoot/../CloudiQ/CloudiQ.psd1" -Force -ErrorAction Stop
    Get-Content -Path "$PSScriptRoot/_mocks/organizations.ps1"
}

Describe 'Test Get-CloudiQOrganization' {
    BeforeAll {
        . "$PSScriptRoot/_mocks/organizations.ps1"
    }

    It 'Should result in listing four demo customers' {
        $Organizations = Get-CloudiQOrganization
        $Organizations.count | Should -be 4
    }
}