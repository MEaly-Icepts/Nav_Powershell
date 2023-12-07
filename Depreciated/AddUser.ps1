<#
.SYNOPSIS
    Add new users to an On Prem Dynamics BC 
    
.DESCRIPTION
    This script is to add additinal users to a Dynamics BC instances

.NOTES

.COMPONENT
    Requres the NAVAdminTool.ps1 loaded

#>

#Import the NavAdmin Module
Import-Module “${env:ProgramFiles}\Microsoft Dynamics NAV\110\Service\NAVAdminTool.ps1”
#Nav version changes the 110 to a different number
#Import the CSV file **Change the -path to the file
$Users = Import-CSV -path "\\server\share\file.csv"
#Variables
$InstanceName = "NavInstance"
#Execute script
foreach ($User in $Users)
{
$FullName = $User.'FullName'
$Login = $User.'Login'
$Email = $User.'Email'
$Profile = $User.'Profile'
$Company = $User.'Company'

New-NavServerUser -ServerInstance $InstanceName -WindowsAccount $Login -FullName "$FullName" -ContactEmail "$Email" -ProfileID "$Profile" -Company "$Company" -LanguageId 1033 -Force
}
