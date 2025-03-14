# Utilisation de l'image Amazon Corretto 17
FROM amazoncorretto:17-alpine AS backend

# Définir un répertoire de travail
WORKDIR /app

# Copier le fichier JAR de l'application
COPY app/target/paymybuddy.jar /app/paymybuddy.jar

# Exposer le port 8080
EXPOSE 8080

# Commande d'exécution
CMD ["java", "-jar", "/app/paymybuddy.jar"]

# Utilisation de l'image officielle MySQL
FROM mysql:latest AS mysql

# Définir le mot de passe root
ENV MYSQL_ROOT_PASSWORD=password
ENV MYSQL_DATABASE=db_paymybuddy

# Copier les scripts d'initialisation dans le dossier prévu par MySQL
COPY app/initdb/ /docker-entrypoint-initdb.d/

# Exposer le port MySQL
EXPOSE 3306
