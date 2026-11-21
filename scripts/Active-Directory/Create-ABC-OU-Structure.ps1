Import-Module ActiveDirectory

$BaseDN = "DC=lab,DC=local"
$RootOU = "OU=ABC-Technologies,$BaseDN"

if (-not (Get-ADOrganizationalUnit -Identity $RootOU -ErrorAction SilentlyContinue)) {
    New-ADOrganizationalUnit -Name "ABC-Technologies" `
        -Path $BaseDN -ProtectedFromAccidentalDeletion $true
}

$OUs = @(
    "ABC-Users",
    "ABC-Servers",
    "ABC-Groups",
    "ABC-Workstations",
    "ABC-ServiceAccounts"
)

foreach ($OU in $OUs) {
    $Path = "OU=$OU,$RootOU"

    if (-not (Get-ADOrganizationalUnit -Identity $Path -ErrorAction SilentlyContinue)) {
        New-ADOrganizationalUnit -Name $OU -Path $RootOU `
            -ProtectedFromAccidentalDeletion $true
    }
}

$Departments = @("HR","Finance","IT","Sales","Management")

foreach ($Department in $Departments) {
    $Path = "OU=$Department,OU=ABC-Users,$RootOU"

    if (-not (Get-ADOrganizationalUnit -Identity $Path -ErrorAction SilentlyContinue)) {
        New-ADOrganizationalUnit -Name $Department `
            -Path "OU=ABC-Users,$RootOU" `
            -ProtectedFromAccidentalDeletion $true
    }
}

Write-Host "ABC Technologies OU structure checked."
