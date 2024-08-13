#!/bin/bash
# Função para exibir a ajuda
function show_help() {
  echo "Bem vindo ao password-generator! Versão 1.0, (c) 2024, Fulano de Tal, DIMAp, UFRN"
  echo "Uso: ./password-generator.sh [OPÇÕES]"
  echo "Opções: "
  echo " -l [COMPRIMENTO] : comprimento da senha"
  echo " -u               : incluir letras maiúsculas"
  echo " -d               : incluir números"
  echo " -s               : incluir símbolos"
  echo " -h               : exibir essa mensagem de ajuda"

  echo "O comportamento padrão do script é gerar uma senha de 8 caracteres minúsculos."
}
