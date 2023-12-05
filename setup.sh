#!/bin/bash

set -e

# Mettez à jour et installez les packages de base
apt-get update
apt-get upgrade -y
apt-get install -y vim git python3 python3-virtualenv python-is-python3 python3-pip python3-dev build-essential libssl-dev libffi-dev python3-setuptools libicu-dev python3-icu pkg-config nginx

# Téléchargez le code source de LibreTranslate
git clone https://github.com/LibreTranslate/LibreTranslate.git /home/libretranslate/LibreTranslate

# Configurez l'environnement virtuel
virtualenv /home/libretranslate/LibreTranslate/env

# Installez gunicorn
/home/libretranslate/LibreTranslate/env/bin/pip install gunicorn

# Installez LibreTranslate
/home/libretranslate/LibreTranslate/env/bin/pip install /home/libretranslate/LibreTranslate/ --no-cache-dir

# Exécutez LibreTranslate sur le port 5000
/home/libretranslate/LibreTranslate/env/bin/libretranslate
