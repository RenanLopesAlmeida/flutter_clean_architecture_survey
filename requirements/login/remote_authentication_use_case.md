# Remote Authentication Use Case

> ## Case de sucesso
1. Sistema valida os dados
2. Sistema faz uma requisição para a URL da API de login
3. Sistema valida os dados recebidos da API
4. Sistema entrega os dados da conta do usuario

> ## Exceção - URL invalida
1. Sistema retorna uma mensagem de erro

> ## Exceção - Dados Invalidos
1. Sistema retorna uma mensagem de erro inesperado

> ## Exceção - Resposta Invalida
1. Sistema retorna mensagem de erro inesperado

> ## Exceção - Falha no Servidor
1. Sistema retorna mensagem de erro inesperado

> ## Exceção - Credenciais inválidas
1. Sistema retorna mensagem de erro inesperado informando que as credenciais estão erradas
