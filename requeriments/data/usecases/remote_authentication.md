# Remote Authentication Use Case

> ## Caso de sucesso (OK - 200)
1. ✅ Sistema faz uma requisição para a URL da API de login
2. ✅ Sistema faz uma requisição para o método correto
3. ✅ Sistema valida os dados recebidos
4. ✅ Sistema entrega os dados da conta do usuário

> ## Exceção - Dados inválidos (Validation Error - 422)
5. ❌ Sistema retorna uma mensagem de erro inesperado

> ## Exceção - Falha no servidor (Internal Server Error - 500)
6. ❌ Sistema retorna uma mensagem de erro inesperado

> ## Exceção - Resposta inválida (OK - 200)
7. ❌ Sistema retorna uma mensagem de erro inesperado