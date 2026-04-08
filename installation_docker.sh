#!/usr/bin/env bash
set -e
#message hello
echo "________________________________________________"
echo "Bienvenue sur le script d'installation de docker"
echo "de Baptiste Cousin"
echo "------------------------------------------------"
sleep 1


#mise à jour système
echo "______________________________________________"
echo "[INFO] Mise à jour du système..."
echo "______________________________________________"
apt-get update -y
echo "______________________________________________"
echo "[OK] Mise à jour terminée !"
echo "______________________________________________"

#installation des dépendances
echo "______________________________________________"
echo "[INFO] Installation des dépendances..."
echo "______________________________________________"
apt-get install -y ca-certificates curl gnupg
echo "______________________________________________"
echo "[OK] Dépendances installées !"
echo "______________________________________________"

#préparer le keyring
echo "______________________________________________"
echo "[INFO] Préparation du keyring apt..."
echo "______________________________________________"
install -m 0755 -d /etc/apt/keyrings
echo "______________________________________________"
echo "[OK] Répertoire /etc/apt/keyrings prêt !"
echo "______________________________________________"

#télécharger la clé gpg et la stocker
echo "______________________________________________"
echo "[INFO] Téléchargement de la clé GPG Docker..."
echo "______________________________________________"
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg
echo "______________________________________________"
echo "[OK] Clé GPG Docker ajoutée !"
echo "______________________________________________"

#ajouter le repository Docker
echo "______________________________________________"
echo "[INFO] Ajout du repository Docker..."
echo "______________________________________________"
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian bookworm stable" \
  > /etc/apt/sources.list.d/docker.list
apt-get update -y
echo "______________________________________________"
echo "[OK] Repository ajouté !"
echo "______________________________________________"

#installer les paquets Docker
echo "______________________________________________"
echo "[INFO] Installation des paquets Docker..."
echo "______________________________________________"
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
echo "______________________________________________"
echo "[OK] Paquets Docker installés !"
echo "______________________________________________"

#démarrer le service
echo "______________________________________________"
echo "[INFO] Activation et démarrage du service Docker..."
echo "______________________________________________"
systemctl enable docker
systemctl start docker
echo "______________________________________________"
echo "[OK] Service Docker démarré !"
echo "______________________________________________"

sleep 1
#script terminée
echo "----------------------------------------------"
echo "L'installation est terminée ! Docker est prêt"
echo "______________________________________________"
