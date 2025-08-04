#!/bin/bash

repo_name=$1            # Argument : nom du dossier à réorganiser
script_name="creation_script.sh"  # Nom du script de création (à écrire dans les fichiers)

mkdir -p root/$repo_name   # Crée la racine "root/nom_du_repo"

# Parcourt tous les fichiers .txt dans le dossier
find "$repo_name" -type f -name "*.txt" | while read file; do
    filename=$(basename "$file")           # Récupère juste le nom du fichier (sans chemin)
    prefix=$(echo "$filename" | cut -d'_' -f1)       # Récupère le préfixe (avant le "_")
    datetime=$(echo "$filename" | cut -d'_' -f2 | sed 's/\.txt//')  # Enlève l'extension

    # Découpe la date en morceaux
    year=$(echo $datetime | cut -d'-' -f1)
    month=$(echo $datetime | cut -d'-' -f2)
    day=$(echo $datetime | cut -d'-' -f3)
    hour=$(echo $datetime | cut -d'-' -f4)
    minute=$(echo $datetime | cut -d'-' -f5)
    second=$(echo $datetime | cut -d'-' -f6)
    ms=$(echo $datetime | cut -d'-' -f7)

    # Crée la hiérarchie de dossiers demandée
    newdir="root/$repo_name/$prefix/$year/$month/$day/$hour"
    mkdir -p "$newdir"

    newfile="${minute}${second}${ms}.dat"      # Nouveau nom (MinuteSecondeMilliseconde)
    newpath="$newdir/$newfile"

    # Crée le nouveau fichier avec 3 lignes dedans
    echo "$filename" > "$newpath"
    echo "$file" >> "$newpath"
    echo "$script_name" >> "$newpath"

    chmod 600 "$newpath"   # Modifie les droits : seul toi peux lire/écrire
done
