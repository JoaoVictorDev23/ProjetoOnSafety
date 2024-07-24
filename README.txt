Projeto Angular + Spring Boot + MySQL para o Processo Seletivo da OnSafety.
Este projeto consiste em um sistema que utiliza Angular para o front-end, Spring Boot  para o back-end e MySQL como banco de dados. Abaixo estão as instruções para rodar o projeto localmente e informações sobre a estrutura do sistema.

*Pré-requisitos*
Certifique-se de ter os seguintes softwares instalados em seu computador:

*MySQL Server, indica-se usar a versão 8.0.39 (Certifique-se de que o servidor MySQL não está sendo executado na porta 3306 e que você está
usando o usuário root com a senha admin)
*Docker


*Início Rápido*
Para iniciar o projeto, você pode usar os scripts fornecidos:

No Windows: Execute StartProject.bat.
No Linux: Execute StartProject.sh.
Alternativamente, você pode rodar o projeto usando Docker com o comando:

bash
Copiar código
docker compose run --build
Certifique-se de executar o comando na pasta raiz do projeto.


Front-End (Angular)
O front-end é uma interface simples com duas rotas principais:

/pessoas: Exibe a listagem geral das pessoas, permitindo que você visualize, edite e exclua registros.
/cadastrar: Permite a adição de novas pessoas.
O sistema possui uma barra lateral para facilitar a navegação entre os componentes. O aplicativo inicia na página de listagem de pessoas.

Configuração Local
Para rodar o front-end localmente, siga os passos abaixo:

Certifique-se de ter o Node.js 18.20.3 instalado.
Navegue até a pasta do front-end.
Execute npm install para instalar as dependências.
Inicie o servidor Angular com ng serve.
O front-end será servido na URL http://localhost:4200.

Código Fonte
O código fonte do front-end está disponível na pasta front-end-main.

Back-End (Spring Boot)
O back-end é responsável por gerenciar as operações CRUD (Create, Read, Update, Delete) para os dados de pessoas. Os métodos disponíveis são:

GET: Retorna a lista de pessoas.
POST: Adiciona uma nova pessoa.
PUT: Atualiza os dados de uma pessoa existente. (Requer o ID do usuário na URL)
DELETE: Remove uma pessoa existente. (Requer o ID do usuário na URL)
Todos os métodos são acessíveis a partir da rota /api/pessoas.

Configuração Local
Para rodar o back-end localmente, siga os passos abaixo:

Certifique-se de ter o JDK 17 e o Maven instalados.
Navegue até a pasta do back-end.
Execute mvn spring-boot:run para iniciar o servidor.
Código Fonte
O código fonte do back-end está disponível na pasta correspondente.

Banco de Dados (MySQL)
O banco de dados é pré-configurado com dois dados fictícios e inclui validação de CPF.




