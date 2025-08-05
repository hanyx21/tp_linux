#!/bin/bash

prefix=$1         # Le 1er argument : préfixe (ex: git, python...)
count=$2          # Le 2e argument : nombre de fichiers à créer
delay=$3          # Le 3e argument : délai entre les fichiers (en millisecondes)
repo_name=$4      # Le 4e argument : nom du dossier où créer les fichiers

mkdir -p "$repo_name"  # Crée le dossier s’il n’existe pas

for ((i=1; i<=count; i++)); do
    timestamp=$(date +"%Y-%m-%d-%H-%M-%S-%3N")         # Timestamp avec millisecondes
    filename="${prefix}_${timestamp}.txt"              # Nom du fichier
    touch "$repo_name/$filename"                       # Crée le fichier

    echo "Fichier $i créé : $filename"

    # Si ce n’est pas le dernier fichier, on fait une pause
    if [[ $i -lt $count ]]; then
        # Délai standard entre fichiers (conversion ms → s)
        sleep_time=$(echo "$delay / 1000" | bc -l)
        sleep $sleep_time

        # Pause spéciale toutes les 2 créations
        if (( i % 2 == 0 )); then
            echo "⏸ Pause après 2 fichiers..."
            sleep 2  # ← tu peux changer ici la durée de pause spéciale (en secondes)
        fi
    fi
done
