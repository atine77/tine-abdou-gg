#Exercice 1
# function LeNombrePremier {
#     param (
#         [int]$nbr
#     )

#     if ($nbr -le 1) {
#         return $false
#     }

#     for ($i = 2; $i -lt $nbr; $i++) {
#         if ($nbr % $i -eq 0) {
#             return $false
#         }
#     }

#     return $true
# }

# $nbrsaisie = Read-Host "Veuillez entrer un nombre entier"

# # Vérification que c'est un entier positif
# if ($nbrsaisie -match '^\d+$') {
#     $nbrsaisie = [int]$nbrsaisie
#     if (LeNombrePremier $nbrsaisie) {
#         Write-Host "$nbrsaisie est un nombre premier"
#     } else {
#         Write-Host "$nbrsaisie n'est pas un nombre premier."
#     }
# } else {
#     Write-Host "Veuillez entrer un nombre valide"
# }

#Execice 2
# $ages = @()

# # Saisie de 8 âges
# for ($i = 1; $i -le 8; $i++) {
#     $input = Read-Host "Veuillez saisir un âge ($i/8)"
#     $trier = 0

#     if ([int]::TryParse($input, [ref]$trier)) {
#         $ages += $trier
#     } else {
#         Write-Host "Âge invalide, réessayez."
#         $i--  
#     }
# }

# foreach ($age in $ages) {
#     if ($age -lt 12) {
#         $categorie = "enfant"
#     }
#     elseif ($age -ge 12 -and $age -le 17) {
#         $categorie = "adolescent"
#     }
#     elseif ($age -ge 18 -and $age -le 64) {
#         $categorie = "adulte"
#     }
#     else {
#         $categorie = "aîné"
#     }

#     Write-Host "Cet âge : $age appartient à la catégorie : $categorie"
# }

#Exercice 3:
# $nombres = @(5, 8, 12, 5, 9, 8, 4, 12, 3, 5)
# $doublons = @()

# for ($i = 0; $i -lt $nombres.Length; $i++) {
#     for ($j = $i + 1; $j -lt $nombres.Length; $j++) {
#         if ($nombres[$i] -eq $nombres[$j] -and -not ($doublons -contains $nombres[$i])) {
#             $doublons += $nombres[$i]
#         }
#     }
# }

# if ($doublons.Count -gt 0) {
#     Write-Host "Doublons trouvés : $($doublons -join ', ')"
# } else {
#     Write-Host "Aucun doublon trouvé"
# }

# Write-Host "Tous les nombres : $($nombres -join ', ')"

#Exercice 4
# $notes = @()
# $somme = 0

# for ($i = 1; $i -le 6; $i++) {
#     $input = Read-Host "Veuillez saisir une note entre 0 et 100"
    
#     if ([int]::TryParse($input, [ref]$note) -and $note -ge 0 -and $note -le 100) {
#         $notes += $note
#         $somme += $note
#     } else {
#         Write-Host "Note invalide. Veuillez entrer un entier entre 0 et 100."
#         $i-- # On redemande la même note
#     }
# }

# $moyenne = $somme / $notes.Count

# Write-Host "Les notes saisies : $($notes -join ', ')"
# Write-Host "Somme des notes : $somme"
# Write-Host "La moyenne est : $moyenne"

# Write-Host "=== MENU PRINCIPAL ==="
# Write-Host "1. Afficher la date"
# Write-Host "2. Lister les fichiers"
# Write-Host "3. Quitter"

# $choix = Read-Host "Entrez votre choix"

# Switch ($choix) {
#     1 { Get-Date }
#     2 { Get-ChildItem }
#     3 { Write-Host "Au revoir !" }
#     Default { Write-Host "Choix invalide !" }
# }


# do {
#     Write-Host "`n=== MENU INTERACTIF ==="
#     Write-Host "1. Afficher le répertoire courant"
#     Write-Host "2. Voir les 5 premiers processus"
#     Write-Host "3. Quitter"

#     $option = Read-Host "Votre choix"

#     Switch ($option) {
#         1 { Get-Location }
#         2 { Get-Process | Select-Object -First 5 }
#         3 { Write-Host "Fin du programme." }
#         Default { Write-Host "Choix invalide, réessayez !" }
#     }

# } while ($option -ne 3)


# Option 4 : Quitter

# Afficher un message "Merci d'avoir utilisé l'outil !" et sortir de la boucle.


#SCRIPT POWERSHELL QUI PERMET DE CREER UN COMPTE UTILISATEUR
# Demande du nom d'utilisateur
$username = Read-Host "Entrez le nom du nouvel utilisateur"

# Demande du mot de passe (en masqué)
$password = Read-Host "Entrez le mot de passe" -AsSecureString

# Création du compte utilisateur
New-LocalUser -Name $username -Password $password -FullName $username -Description "Compte créé via PowerShell"

# Ajout de l'utilisateur au groupe "Users"
Add-LocalGroupMember -Group "Users" -Member $username

Write-Host "✅ L'utilisateur $username a été créé avec succès !"
