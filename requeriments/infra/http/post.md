# HTTP Post

> ## Sucesso
1. ✅ Request com verbo http correto (post)
2. ❌ Passar nos headers o content type JSON
3. ❌ Chamar request com body correto
4. ❌ Ok - 200 e resposta com dados
5. ❌ Ok - 200 e sem body
6. ❌ No content - 204 e resposta sem dados
7. ❌ No content - 204 e resposta com dados

> ## Erros
8. ❌ Validation Error - 422
9. ❌ Internal server error - 500

> ## Exceção - Status code diferente dos citados acima
10.❌ Internal server error - 500

> ## Exceção - Http request deu alguma exceção
11.❌ Internal server error - 500

> ## Exceção - Verbo http inválido
12.❌ Internal server error - 500