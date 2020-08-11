@{
    RootModule        = 'Cloud-iQ.PowerShell.psm1'
    ModuleVersion     = '0.0.1'
    GUID              = '84a3337c-3d0b-4483-bd52-d7cf06a3ab8b'
    Author            = 'Crayon'
    CompanyName       = 'Crayon'
    Copyright         = 'Cloud-iQ.PowerShell is licensed under the GNU General Public License v3.0'
    Description       = 'Module to automate Crayon Cloud-iQ'
    FunctionsToExport = @("Connect-CloudiQ", "Get-CloudiQSubscription")
    CmdletsToExport   = ''
    VariablesToExport = ''
    AliasesToExport   = ''
    PrivateData       = @{
        PSData = @{
            Tags         = @("Crayon", "Cloud-iQ")
            ProjectUri   = 'https://github.com/CrayonAS/Crayon.Cloud-iQ.PowerShell'
            ReleaseNotes = 'https://github.com/CrayonAS/Crayon.Cloud-iQ.PowerShell/releases'
        }
    }
    HelpInfoURI       = 'https://github.com/CrayonAS/Crayon.Cloud-iQ.PowerShell/wiki'
}