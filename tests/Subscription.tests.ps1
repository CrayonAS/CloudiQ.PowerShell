BeforeAll {
    # Import module
    Import-Module -Name "$PSScriptRoot/../CloudiQ/CloudiQ.psd1" -Force -ErrorAction Stop
}

Describe 'Subscription tests' {
    BeforeAll {
        . "$PSScriptRoot/mocks/subscriptions.ps1"
    }

    It 'Should result in all available subscriptions' {
        $subscriptions = Get-CloudiQSubscription
        $subscriptions.count | Should -Be 6
    }
}