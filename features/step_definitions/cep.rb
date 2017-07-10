Dado(/^que realizo uma consulta na api de cep$/) do
  @uri = "http://viacep.com.br/ws/"
end

Quando(/^informar um cep valido$/) do
  @url = @uri + CEP["cep"]["valido"]
  @response = HTTParty.get(@url)
end

Quando(/^informar um cep com caracteres alfabéticos$/) do
  @url = @uri + CEP["cep"]["letras"]
  @response = HTTParty.get(@url)
end

Quando(/^informar um cep com menos caracteres$/) do
  @url = @uri + CEP["cep"]["menos_numeros"]
  @response = HTTParty.get(@url)
end

Quando(/^informar um cep com mais caracteres$/) do
  @url = @uri + CEP["cep"]["mais_numeros"]
  @response = HTTParty.get(@url)
end

Quando(/^informar um cep com caracteres especiais$/) do
  @url = @uri + CEP["cep"]["caracter_especial"]
  @response = HTTParty.get(@url)
end

Quando(/^informar um cep em branco$/) do
  @url = @uri + CEP["cep"]["branco"]
  @response = HTTParty.get(@url)
end

Quando(/^informar um cep inexistente$/) do
  @url = @uri + CEP["cep"]["inexistente"]
  @response = HTTParty.get(@url)
end

Então(/^devo visualizar os dados do endereço$/) do
  puts @response.body
  CEP["cep"]["campos"].each{|cep| expect(@response.body).to include(cep)}
  CEP["cep"]["resultado"].each{|cep| expect(@response.body.force_encoding 'UTF-8').to include(cep)}
  expect(@response.code).to eq 200
end

Então(/^devo visualizar o erro$/) do
  puts @response.body
  CEP["cep"]["campos"].each{|cep| expect(@response.body).to_not include(cep)}
  expect(@response.code).to eq 400
end

Então(/^devo visualizar o erro tratado$/) do
  puts @response.body
  CEP["cep"]["campos"].each{|cep| expect(@response.body).to_not include(cep)}
  expect(@response.code).to eq 200
end


Dado(/^que realizo um post na api fake$/) do
  @uri = "https://jsonplaceholder.typicode.com/"
end

Quando(/^informar dados do post$/) do
  @url = @uri + "comments"
  @response = HTTParty.post(@url, body: {teste: 123456})
end

Então(/^devo verificar que o post foi alterado$/) do
  puts @response.body
  expect(@response.code).to eq 201
end
