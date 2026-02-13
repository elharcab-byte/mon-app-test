#!/bin/bash

# ERREUR 1 : Mot de passe en clair (Interdit par ShellCheck / Règles de sécurité)
PASSWORD="admin123"

# ERREUR 2 : Variable non protégée par des guillemets (Mauvaise pratique)
NOM_DOSSIER=Mon Dossier Avec Espaces

# ERREUR 3 : Utilisation d'une variable non définie
echo "Bienvenue $USER_NAME"

# ERREUR 4 : Syntaxe cassée (Pas de 'fi' pour fermer le 'if')
if [ "$PASSWORD" == "admin123" ]; then
    echo "Accès autorisé"
# Ici, il manque le 'fi' -> ShellCheck et l'exécution vont hurler.
