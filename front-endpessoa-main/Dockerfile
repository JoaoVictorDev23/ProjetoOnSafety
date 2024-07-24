# Usando uma imagem oficial do Node.js como base
FROM node:18

# Configurando o diretório de trabalho
WORKDIR /app

# Copiando os arquivos do projeto
COPY . .

# Instalando as dependências
RUN npm install

# Expondo a porta que o Angular usará
EXPOSE 4200

# Iniciando a aplicação Angular usando o servidor de desenvolvimento
CMD ["npm", "start", "--", "--host", "0.0.0.0"]
