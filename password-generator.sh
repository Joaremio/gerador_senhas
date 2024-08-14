#!/bin/bash
# Função para exibir a ajuda
show_help(){
  echo "Bem vindo ao password-generator! Versão 1.0, (c) 2024, Fulano de Tal, DIMAp, UFRN"
  echo "Uso: ./password-generator.sh [OPÇÕES]"
  echo "Opções: "
  echo "  -l [COMPRIMENTO] : comprimento da senha"
  echo "  -u               : incluir letras maiúsculas"
  echo "  -d               : incluir números"
  echo "  -s               : incluir símbolos"
  echo "  -h               : exibir essa mensagem de ajuda"

  echo "O comportamento padrão do script é gerar uma senha de 8 caracteres minúsculos."
}

# Definir variáveis padrão
LENGTH=8
USE_UPPERCASE=false
USE_DIGITS=false
USE_SYMBOLS=false

# Parsear argumentos
# { Implementação vai aqui }

# Definir conjuntos de caracteres
LOWERCASE="abcdefghijklmnopqrstuvwxyz"
UPPERCASE="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
DIGITS="0123456789"
SYMBOLS="!@#$%^&*()-_=+[]{}|;:,.<>?/~"

# Construir a lista de caracteres permitidos
# { Implementação vem aqui }

# Gerar a senha:
# o /dev/urandom gera bytes aleatórios, para conseguir
# uma senha precisamos limpar esses bytes de alguma forma
PASSWORD=$(cat /dev/urandom)

# Exibir a senha gerada
echo "Senha gerada: $PASSWORD"

# Opcional: salvar a senha em um arquivo criptografado
# Implemente como essa senha será criptografada com o openssl
echo $PASSWORD >> password.txt.enc
