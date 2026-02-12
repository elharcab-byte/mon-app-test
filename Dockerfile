# On utilise Nginx comme serveur web léger
FROM nginx:alpine

# On copie notre fichier html dans le dossier de Nginx
COPY index.html /usr/share/nginx/html/index.html

# On expose le port 80
EXPOSE 80
