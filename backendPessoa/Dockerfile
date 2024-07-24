# Usando uma imagem oficial do OpenJDK como base
FROM openjdk:17-jdk-slim

# Configurando o diretório de trabalho
WORKDIR /app

# Copiando o arquivo JAR do backend para o container
COPY target/backendPessoa-0.0.1-SNAPSHOT.jar /app/backendPessoa-0.0.1-SNAPSHOT.jar

# Expondo a porta que o Spring Boot usará
EXPOSE 8080

# Comando para rodar a aplicação
ENTRYPOINT ["java", "-jar", "/app/backendPessoa-0.0.1-SNAPSHOT.jar"]
