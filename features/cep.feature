#language: pt
@cep
Funcionalidade: Cep
    Eu como usuario
    Devo passar os parametros do cep
    Para receber os dados do cep informado

@cep_valido
Cenario: Verificar cep valido
    Dado que realizo uma consulta na api de cep
    Quando informo um cep valido
    Então deve me retornar os dados do endereco

@cep_inexistente
Cenario: Verificar cep valido
    Dado que realizo uma consulta na api de cep
    Quando informo um cep inexistente
    Então deve me retornar uma mensagem de erro

@cep_letras
Cenario: Verificar cep com caracteres alfabéticos
    Dado que realizo uma consulta na api de cep
    Quando informo um cep com caracteres alfabéticos
    Então deve me retornar erro

@cep_menor
Cenario: Verificar cep com menos caracteres
    Dado que realizo uma consulta na api de cep
    Quando informo um cep com menos caracteres
    Então deve me retornar erro

@cep_maior
Cenario: Verificar cep com mais caracteres
    Dado que realizo uma consulta na api de cep
    Quando informo um cep com mais caracteres
    Então deve me retornar erro

@cep_caracter_especial
Cenario: Verificar cep com caracteres especiais
    Dado que realizo uma consulta na api de cep
    Quando informo um cep com caracteres especiais
    Então deve me retornar erro

@cep_branco
Cenario: Verificar cep com caracteres especiais
    Dado que realizo uma consulta na api de cep
    Quando informo um cep em branco
    Então deve me retornar erro