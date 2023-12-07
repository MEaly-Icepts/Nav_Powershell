<#
.SYNOPSIS
    Assign MS Dynamics Nav permissions to users i na CSV file

.NOTES
   File Name: AssignPermissions.ps1
	Author: Mathew Ealy
	Requires Powershell 5.0

    CSV File Format
    Login,PermisionSet,Company,

.COMPONENT
    Requires NAVAdminTool.ps1

.LINK
    https://github.com/MEaly58/Nav_Powershell/blob/master/AssignPermissions.ps1

#>
#Import the NavAdmin Module
Import-Module “${env:ProgramFiles}\Microsoft Dynamics NAV\110\Service\NAVAdminTool.ps1”

#Nav version changes the 110 to a different number
$Users = Import-CSV -path "\\filepath.csv"
$Instance = "DynamicsNAV110"

#Run Script
foreach ($User in $Users)
{
$Login = $User.'Login'
$PermissionSet = $User.'PermissionSet'
$Company = $User.'Company'

New-NAVServerUserPermissionSet -ServerInstance "$Instance" -WindowsAccount "$Login" -PermissionSetId "$PermissionSet" -CompanyName "$Company" -Scope System
}
