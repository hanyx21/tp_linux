#!/bin/bash

prefix=$1         # Le 1er argument : préfixe (ex: git, python...)
count=$2          # Le 2e argument : nombre de fichiers à créer
delay=$3          # Le 3e argument : délai entre les fichiers (en millisecondes)
repo_name=$4      # Le 4e argument : nom du dossier où créer les fichiers

mkdir -p "$repo_name"  # Crée le dossier s’il n’existe pas

for ((i=0; i<$count; i++)); do
    timestamp=$(date +"%Y-%m-%d-%H-%M-%S-%3N")  # Récupère l’heure exacte avec millisecondes
    filename="${prefix}_${timestamp}.txt"      # Crée un nom de fichier
    touch "$repo_name/$filename"               # Crée le fichier vide
    sleep_time=$(echo "$delay / 1000" | bc -l) # Convertit le délai en secondes
    sleep $sleep_time                          # Attend le délai avant de créer le fichier suivant
done
