#!/bin/bash

# Nombre de fichiers à créer par préfixe
N=3

# Délai en millisecondes entre les fichiers
M=200

# Catégories et préfixes
declare -A categories
categories[repo_devops]="linux git aws"
categories[repo_data]="python scala spark"
categories[repo_fonctionnel]="spec sql postman"

# Boucle sur chaque catégorie
for repo in "${!categories[@]}"; do
  for prefix in ${categories[$repo]}; do
    echo "Création des fichiers pour prefix=$prefix dans $repo"
    ./creation_script.sh "$prefix" "$N" "$M" "$repo"
  done
done
