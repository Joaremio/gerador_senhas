# CHANGELOG

## [2.0.0] - 2024-08-14
### Adicionado
- Implementação da funcionalidade para salvar senhas em um arquivo criptografado usando `openssl`.
- Adicionada a opção `-n` para nomear senhas geradas.
- Adicionada a opção `-p` para listar senhas armazenadas (descriptografadas).
- Atualização da interface de ajuda (`-h`) para incluir as novas opções `-n`, `-p` e `-o`.

### Alterado
- Melhorias na estrutura do código e organização das opções.

## [1.0.0] - 2024-08-01
### Adicionado
- Lançamento inicial do script gerador de senhas.
- Opções para especificar o comprimento da senha (`-l`), incluir letras maiúsculas (`-u`), dígitos (`-d`), e símbolos (`-s`).
- Funcionalidade básica para gerar senhas com diferentes níveis de complexidade.

