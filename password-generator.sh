#!/bin/bash
# Função para exibir a ajuda
show_help(){
  echo "Bem vindo ao password generator! Versão 2.0, (c) 2024, José Bernardo e Joaremio Neto, DIMAp, UFRN"
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

while getopts ":l:udso:n:ph" opt; do
  case ${opt} in
    l) LENGTH=$OPTARG ;;
    u) USE_UPPERCASE=true ;;
    d) USE_DIGITS=true ;;
    s) USE_SYMBOLS=true ;;
    o) OUTPUT_FILE="${!OPTIND}"; OPTIND=$(( $OPTIND + 1 )) ;;  # Lê o próximo argumento como o nome do arquivo
    n) PASSWORD_NAME=$OPTARG ;;
    p) cat "$OUTPUT_FILE"
       exit 0 ;;
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
PASSWORD=$(cat /dev/urandom | tr -dc "$CHAR_SET" | head -c $LENGTH)

# Exibir a senha gerada
echo "Senha gerada: $PASSWORD"

if [ -n "$PASSWORD_NAME" ]; then
  echo "$PASSWORD_NAME: $PASSWORD" >> $OUTPUT_FILE
else
  echo "$PASSWORD" >> $OUTPUT_FILE
fi

# Opcional: salvar a senha em um arquivo criptografado
# Implemente como essa senha será criptografada com o openssl
if [ -n "$PASSWORD_NAME" ]; then
  echo -n "$PASSWORD_NAME: $PASSWORD" | openssl enc -aes-256-cbc -salt -pbkdf2 -iter 100000 -out "$OUTPUT_FILE.enc" -pass pass:password
else
  echo -n "$PASSWORD" | openssl enc -aes-256-cbc -salt -pbkdf2 -iter 100000 -out "$OUTPUT_FILE.enc" -pass pass:password
fi

