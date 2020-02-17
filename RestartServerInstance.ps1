<# Import Modules #>
Import-Module "${env:ProgramFiles}\Microsoft Dynamics NAV\90\Service\Microsoft.Dynamics.Nav.Model.Tools.psd1" -WarningAction SilentlyContinue | out-null
Import-Module "${env:ProgramFiles}\Microsoft Dynamics NAV\90\Service\NavAdminTool.ps1" -WarningAction SilentlyContinue | Out-Null
<# Run against Dynamics NAV servers running 16 #>
$Instances = Get-NAVServerInstance

for ($i = 0; $i -le $Instances.Count - 1; $i++) {    
    if ($Instances[$i].State -eq 'Running') {        
		 $Instances[$i].ServerInstance
         Set-NAVServerInstance $Instances[$i].ServerInstance -Restart    
    }
}
