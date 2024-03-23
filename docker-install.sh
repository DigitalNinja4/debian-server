#!/bin/bash

# Aktualizacja repozytoriów
sudo apt update

# Instalacja pakietów niezbędnych do dodania repozytorium Docker
sudo apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common

# Dodanie klucza GPG dla repozytorium Docker
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Dodanie repozytorium Docker
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_rel>

# Ponowna aktualizacja repozytoriów
sudo apt update

# Instalacja Docker Engine
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Dodanie bieżącego użytkownika do grupy docker (aby uniknąć użycia sudo przy każdym użyciu Docker)
sudo usermod -aG docker $USER

# Włączenie i uruchomienie usługi Docker
sudo systemctl enable docker
sudo systemctl start docker

# Sprawdzenie zainstalowanej wersji Dockera
docker --version

