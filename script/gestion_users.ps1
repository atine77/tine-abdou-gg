 $nomUtilisateur =  Read-Host "Veuillez entrer le nom SVP"
 $motDePasse = Read-Host "Veuillez saisir le mot de passe" -AsSecureString
 New-LocalUser -Name $nomUtilisateur -Password $motDePasse -FullName $nomUtilisateur -Description "Compte crée via PowerShell"
 Add-LocalGroupMember -Group "Users" -Member $nomUtilisateur
 Write-Host "Le compte a été crée avec succes!!!!"