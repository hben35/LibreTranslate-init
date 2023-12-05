# Setup systemd
cp ~/LibreTranslate-init/libretranslate.service /etc/systemd/system/
systemctl start libretranslate
systemctl enable libretranslate
# sudo systemctl status libretranslate

# Configure Nginx
cp ~/LibreTranslate-init/nginx /etc/nginx/sites-available/default
nginx -t
systemctl restart nginx

