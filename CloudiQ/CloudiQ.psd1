@{
    RootModule        = 'CloudiQ.psm1'
    ModuleVersion     = '0.5.0'
    GUID              = '84a3337c-3d0b-4483-bd52-d7cf06a3ab8b'
    Author            = 'Crayon'
    CompanyName       = 'Crayon'
    Copyright         = 'The Cloud-iQ module is licensed under the GNU General Public License v3.0'
    Description       = 'Module to automate licensing through Crayon Cloud-iQ.'
    FunctionsToExport = @("Connect-CloudiQ", "Get-CloudiQSubscription","Get-CloudiQOrganization")
    CmdletsToExport   = ''
    VariablesToExport = ''
    AliasesToExport   = ''
    PrivateData       = @{
        PSData = @{
            Tags         = @("Crayon", "Cloud-iQ", "licensing")
            ProjectUri   = 'https://github.com/CrayonAS/Crayon.Cloud-iQ.PowerShell'
            ReleaseNotes = 'https://github.com/CrayonAS/Crayon.Cloud-iQ.PowerShell/releases'
        }
    }
    HelpInfoURI       = 'https://github.com/CrayonAS/Crayon.Cloud-iQ.PowerShell/wiki'
}