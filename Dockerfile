# Utilisation de l'image Amazon Corretto 17
FROM amazoncorretto:17-alpine

# Définir un répertoire de travail
WORKDIR /app

# Copier le fichier JAR de l'application
COPY target/paymybuddy.jar /app/paymybuddy.jar

# Exposer le port 8080
EXPOSE 8080

# Commande d'exécution
CMD ["java", "-jar", "/app/paymybuddy.jar"]