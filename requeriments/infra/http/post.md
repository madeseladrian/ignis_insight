# HTTP Post

> ## Sucesso
1. ✅ Request com verbo http correto (post)
2. ✅ Passar nos headers o content type JSON
3. ✅ Chamar request com o encoding correto
4. ✅ Chamar request com body correto
5. ❌ Ok - 200 e resposta com dados
6. ❌ Ok - 200 e sem body
7. ❌ No content - 204 e resposta sem dados
8. ❌ No content - 204 e resposta com dados

> ## Erros
9. ❌ Validation Error - 422
10.❌ Internal server error - 500

> ## Exceção - Status code diferente dos citados acima
11.❌ Internal server error - 500

> ## Exceção - Http request deu alguma exceção
12.❌ Internal server error - 500

> ## Exceção - Verbo http inválido
13.❌ Internal server error - 500