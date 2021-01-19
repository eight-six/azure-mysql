[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    $ResourceGroupName
)

$ErrorActionPreference = 'Stop'

$AdminPassword = Read-Host -AsSecureString -Prompt 'Enter admin password'

$Params = @{
    ResourceGroupName = $ResourceGroupName
    TemplateFile = ".\src\template.json"
    TemplateParameterFile  = ".\src\parameters.json"
}

Test-AzResourceGroupDeployment  @Params -administratorLoginPassword $AdminPassword

New-AzResourceGroupDeployment  @Params -administratorLoginPassword $AdminPassword