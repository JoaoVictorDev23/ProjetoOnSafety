# Usando uma imagem oficial do MySQL como base
FROM mysql:8

# Definindo as variáveis de ambiente necessárias
ENV MYSQL_DATABASE=pessoa
ENV MYSQL_ROOT_PASSWORD=admin

# Copiando os scripts de inicialização do banco de dados
COPY ./pessoa_*.sql /docker-entrypoint-initdb.d/

# Expondo a porta que o MySQL usará
EXPOSE 3306
