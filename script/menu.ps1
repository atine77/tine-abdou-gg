# do {
# Write-Host "=======MENU OUTIL TECHNIQUE======="
# Write-host "Information systeme"
# Write-host "Gestion des fichiers"
# Write-host "Liste des utilisateurs"
# Write-host "Surveillance des processus"
# Write-host "Reseau et connectivite"
# Write-host "Quitter"
 
# $Valeur = Read-Host "Choisissez une option (1-6)"
# switch ($valeur) {
#     1 { $(Get-Date), $env:COMPUTERNAME, $env:USERNAME}
#     2 {
#         do {
#             Write-host "=======GESTION DES FICHIERS======="
#             Write-host "1. Lister les fichiers dans un dossier"
#             Write-host "2. Creer un dossier"
#             Write-host "3. Supprimer un dossier"
#             Write-host "4. Retour au menu principal"
#             $choixFichier = Read-Host "Choisissez une option (1-4)"
#             switch ($choixFichier) {
#                 1 {
#                     $dossier = Join-Path ""
#                     Write-host "Fichiers du dossier courant :"
#                     Get-ChildItem -File
#                 }
#                 2 {
#                     $dossier = Read-Host "Entrez le chemin du nouveau dossier"
#                     if (-not (Test-Path $dossier)) {
#                         New-Item -ItemType Directory -Path $dossier
#                         Write-host "Dossier créé : $dossier"
#                     } else {
#                         Write-host "Le dossier existe déjà."
#                     }
#                 }
#                 3 {
#                     $dossier = Read-Host "Entrez le chemin du dossier à supprimer"
#                     if (Test-Path $dossier) {
#                         Remove-Item -Recurse -Force $dossier
#                         Write-host "Dossier supprimé : $dossier"
#                     } else {
#                         Write-host "Le dossier n'existe pas."
#                     }
#                 }
#                 4 { Write-Host "Retour au menu principal" }
#                 default { Write-Host "Option invalide, veuillez choisir entre 1 et 4."}
 
#             }
#         } while ($choixFichier -ne "4")
#     }
 
#     3 { Get-LocalUser | Select-Object Name, Enabled }
#     4 {
#             do {
#                 Write-host "=======SURVEILLANCE DES PROCESSUS======="
#                 Write-host "1. Afficher les 5 processus les plus consommateurs de mémoire"
#                 Write-host "2. Tuer un processus par nom ou PID"
#                 Write-host "3. Retour au menu principal"
                
#                 $choixProcess = Read-Host "Choisissez une option (1-3)"
#                 switch ($choixProcess) {
#                     1 {
#                         Get-Process | Sort-Object -Descending WS | Select-Object -First 5 Name, Id, WS
                       
#                     }
#                     2 {
#                         $inputProc = Read-Host "Entrez le nom ou le PID du processus à tuer"
#                         if ($inputProc -match '^\d+$') {
#                             Stop-Process -Id $inputProc -Force
#                             Write-host "Processus PID $inputProc tué."
#                         } else {
#                             Stop-Process -Name $inputProc -Force
#                             Write-host "Processus '$inputProc' tué."
#                         }
#                     }
#                     3 { Write-host "Retour au menu principal" 
#                      $choixProcess = 3
#                      $valeur = ""
                   
#                 }
#                     default { Write-host "Option invalide, veuillez choisir entre 1 et 3." }
#                 }
#             } while ($choixProcess -ne "3")
#         }
#         5 {
#             do {
#                 Write-host "=======RESEAU ET CONNECTIVITE======="
#                 Write-host "1. Afficher l'adresse IP de la machine"
#                 Write-host "2. Tester la connexion internet"
#                 Write-host "3. Retour au menu principal"
#                 $choixReseau = Read-Host "Choisissez une option (1-3)"
#                 switch ($choixReseau) {
#                     1 {
#                         Get-NetIPAddress | Where-Object AddressFamily -eq IPv4 | Select-Object IPAddress
#                     }
#                     2 {
#                         Test-Connection google.com -Count 2
#                     }
#                     3 { Write-host "Retour au menu principal" }
#                     default { Write-host "Option invalide, veuillez choisir entre 1 et 3." }
#                 }
#             } while ($choixReseau -ne "3")
#         }
#     6 { Write-Host "Au revoir!" }
#     default { Write-Host "Option invalide, veuillez choisir entre 1 et 4."}
 
# }
# } while ($valeur -ne "6")
 
Write-Host "Réseau et connectivité"
Start-Sleep -Seconds 2
Write-Host "Adresse(s) IPv4 :"
Get-NetIPConfiguration -Detailed | Select-Object -ExpandProperty IPv4Address
Write-Host "Niveau de connexion Internet..."
Test-Connection google.com -Count 2 | Format-Table -AutoSize