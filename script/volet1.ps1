#========================
#Gestion Réseau
#========================
Do {
write-host "============ Menu Principal =============="
Write-host "1. Informations réseau"
Write-host "2. Gestion des fichiers"
write-host "3. Liste des processus"
write-host "4. Quitter"

$valeurentrée = Read-Host "Entrez votre choix du menu principal."

switch ($valeurentrée){

    1 {
        write-host "-------------------------------------"
        write-host "Voici l'adresse IP de votre machine."
        write-host "-------------------------------------"
        Get-NetIPAddress | Where-Object { $_.AddressFamily -eq "IPv4" }

        write-host "-------------------------------------"
        write-host "Voici l'adresse MAC de votre machine."
        write-host "-------------------------------------"
        get-netadapter

        write-host "-------------------------------------"
        write-host "Voici le nom de domaine de votre machine."
        write-host "-------------------------------------"
        Get-DnsClient
    }
    2 { Do {
            write-host "------------- Option 2 : Menu Gestion des fichiers -------------"
            write-host "1. Lister les fichiers d'un dossier."
            write-host "2. Créer un fichier texte."
            write-host "3. Supprimer un fichier"
            write-host "4. Quitter le menu de gestion des fichiers"

            $valeurentrée2 = Read-host "Veuillez choisir une des options de gestion des fichiers."

            switch ($valeurentrée2) {
                1 {
                    write-host "-------------------------------------"
                    write-host "Option 1 : Lister les fichiers du dossier ."
                    write-host "-------------------------------------"
                    Get-ChildItem
                }
                2 {
                    write-host "-------------------------------------"
                    $nomfichier = read-host "Option 2 : Veuillez entrer le nom du fichier texte."
                    write-host "-------------------------------------"
                    New-Item -Path "C:\Temp\" -ItemType Directory
                    New-Item -Path "C:\Temp\$nomfichier.txt" -ItemType File
                }
                3 {
                    write-host "-------------------------------------"
                    $nomFichier2 = Read-Host "Option 3 : Veuillez entrer le nom du fichier texte que vous voulez effacer."
                    write-host "-------------------------------------"
                    Remove-Item -Path "C:\Temp\$nomfichier2.txt"
                }
                4 {
                    write-host "-------------------------------------"
                    Write-host "Option 4 : Quitter"
                    write-host "-------------------------------------"
                }
                default {
                    Write-host "ERREUR. Veuillez entrer un choix entre 1 et 4 du menu du gestion des fichiers."
                }
            }
        } While ($valeurentrée2 -ne 4)
    
    }
    3 {
            Write-Host "----------------- Option 3 : Liste des processus -------------------"
            Write-Host "Voici les 10 processus qui consomment le plus de mémoire :"
            Get-Process | Sort-Object -Descending WS | Select-Object -First 10 Name, Id, WS
    }

    4 {
        write-host "Merci d'avoir utilisé l'outil de gestion réseau !"
    }

    Default {Write-host "Choississez une option entre 1 et 4 du menu principal"}
    }

}While ($valeurentrée -ne 4)