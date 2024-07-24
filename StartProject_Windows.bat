:: Executa o comando Docker Compose

@echo off

cd /d "%~dp0"

docker compose up --build
