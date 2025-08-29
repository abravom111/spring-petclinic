FROM openjdk:8-jdk-alpine  # Mejor usar imagen oficial
LABEL maintainer="abravom1@est.ups.edu.ec"

# Crear directorio de trabajo
WORKDIR /app

# Copiar el JAR compilado
COPY target/spring-petclinic-2.3.0.BUILD-SNAPSHOT.jar app.jar

# Exponer puerto (ajusta según tu aplicación)
EXPOSE 8080

# Ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]
