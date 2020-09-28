function Invoke-CloudiQApiRequest($uri) {}
Mock Invoke-CloudiQApiRequest {
    [PSCustomObject]@{
        Items = @{
            Publisher    = 'Microsoft'
            Product      = 'Microsoft 365 E3'
            ProductId    = 67226
            Quantity     = 11
            Organization = 'Demo Customer [T1/EUR]'
        }
    }
    [PSCustomObject]@{
        Items = @{
            Publisher    = 'Microsoft'
            Product      = 'Microsoft 365 E3'
            ProductId    = 191691
            Quantity     = 10
            Organization = 'Demo Customer [T1/EUR]'
        }
    }
    [PSCustomObject]@{
        Items = @{
            Publisher    = 'Microsoft'
            Product      = 'Microsoft 365 E3'
            ProductId    = 70717
            Quantity     = 10
            Organization = 'Demo Customer [T1/USD]'
        }
    }
    [PSCustomObject]@{
        Items = @{
            Publisher    = 'Microsoft'
            Product      = 'Microsoft 365 E5'
            ProductId    = 170607
            Quantity     = 10
            Organization = 'Demo Customer [T2/USD]'
        }
    }
    [PSCustomObject]@{
        Items = @{
            Publisher    = 'Microsoft'
            Product      = 'Microsoft 365 F3'
            ProductId    = 67244
            Quantity     = 10
            Organization = 'Demo Customer [T2/USD]'
        }
    }
    [PSCustomObject]@{
        Items = @{
            Publisher    = 'Microsoft'
            Product      = 'Microsoft 365 Apps for business'
            ProductId    = 143230
            Quantity     = 8
            Organization = 'Demo Customer [T1/EUR]'
        }
    }
}