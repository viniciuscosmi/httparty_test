#language: pt
@cep
Funcionalidade: Cep
    Eu como usuario
    Devo passar os parametros do cep
    Para receber os dados do cep informado

@cep_valido
Cenario: Verificar cep valido
    Dado que realizo uma consulta na api de cep
    Quando informar um cep valido
    Então devo visualizar os dados do endereço

@cep_inexistente
Cenario: Verificar cep valido
    Dado que realizo uma consulta na api de cep
    Quando informar um cep inexistente
    Então devo visualizar o erro tratado

@cep_letras
Cenario: Verificar cep com caracteres alfabéticos
    Dado que realizo uma consulta na api de cep
    Quando informar um cep com caracteres alfabéticos
    Então devo visualizar o erro

@cep_menor
Cenario: Verificar cep com menos caracteres
    Dado que realizo uma consulta na api de cep
    Quando informar um cep com menos caracteres
    Então devo visualizar o erro

@cep_maior
Cenario: Verificar cep com mais caracteres
    Dado que realizo uma consulta na api de cep
    Quando informar um cep com mais caracteres
    Então devo visualizar o erro

@cep_caracter_especial
Cenario: Verificar cep com caracteres especiais
    Dado que realizo uma consulta na api de cep
    Quando informar um cep com caracteres especiais
    Então devo visualizar o erro

@cep_branco
Cenario: Verificar cep com caracteres especiais
    Dado que realizo uma consulta na api de cep
    Quando informar um cep em branco
    Então devo visualizar o erro