#!/bin/bash
# Função para exibir a ajuda
show_help(){
  echo "Bem vindo ao password generator! Versão 2.0, (c) 2024, Cicrano, DIMAp, UFRN"
  echo "Uso: ./password-generator.sh [OPTIONS]"
  echo "Opções: "
  echo "  -l LENGTH  Especifica o tamanho da senha (padrão: 8)"
  echo "  -u         Inclui letras maiúsculas na senha"
  echo "  -d         Inclui dígitos na senha"
  echo "  -s         Inclui símbolos na senha"
  echo "  -o         Salva a senha gerada em um arquivo"
  echo "  -n NAME    Adiciona um nome à senha gerada"
  echo "  -p         Exibe senhas geradas"
  echo "  -h         Exibe essa mensagem de ajuda"
  echo ""
  echo "O comportamento padrão do script é gerar uma senha de 8 caracteres minúsculos."
}

# Definir variáveis padrão
LENGTH=8
USE_UPPERCASE=false
USE_DIGITS=false
USE_SYMBOLS=false
OUTPUT_FILE="passwords.txt"
PASSWORD_NAME=""

# Parsear argumentos

while getopts ":l:uds" opt; do
  case ${opt} in
    l) LENGTH=$OPTARG ;;
    u) USE_UPPERCASE=true ;;
    d) USE_DIGITS=true ;;
    s) USE_SYMBOLS=true ;;
    h) show_help
       exit 0 ;;
    \?) show_help
        exit 1 ;;
    :)
      show_help
      exit 1 ;;
  esac
done

shift $((OPTIND -1))

# Definir conjuntos de caracteres
LOWERCASE="abcdefghijklmnopqrstuvwxyz"
UPPERCASE="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
DIGITS="0123456789"
SYMBOLS="!@#$%^&*()-_=+[]{}|;:,.<>?/~"

# Construir a lista de caracteres permitidos
CHAR_SET=$LOWERCASE
if $USE_UPPERCASE; then
  CHAR_SET+=$UPPERCASE
fi
if $USE_DIGITS; then
  CHAR_SET+=$DIGITS
fi
if $USE_SYMBOLS; then
  CHAR_SET+=$SYMBOLS
fi

# Gerar a senha:
# o /dev/urandom gera bytes aleatórios, para conseguir
# uma senha precisamos limpar esses bytes de alguma forma
PASSWORD=$(cat /dev/urandom | tr -dc "$CHAR_SET" | head -c $LENGTH)

# Exibir a senha gerada
echo "Senha gerada: $PASSWORD"

# Opcional: salvar a senha em um arquivo criptografado
# Implemente como essa senha será criptografada com o openssl
# echo $PASSWORD >> password.txt.enc
