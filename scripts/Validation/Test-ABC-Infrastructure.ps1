# ABC Technologies
# Infrastructure Validation
# Domain: lab.local

Write-Host "===== DOMAIN CONTROLLER =====" -ForegroundColor Cyan
Get-ADDomainController -Identity PC01

Write-Host "===== FSMO ROLES =====" -ForegroundColor Cyan
netdom query fsmo

Write-Host "===== DNS TEST =====" -ForegroundColor Cyan
nslookup lab.local 192.168.0.200

Write-Host "===== DOMAIN DISCOVERY =====" -ForegroundColor Cyan
nltest /dsgetdc:lab.local

Write-Host "===== NETWORK CONFIGURATION =====" -ForegroundColor Cyan
ipconfig /all

Write-Host "===== INFRASTRUCTURE VALIDATION FINISHED =====" -ForegroundColor Green
