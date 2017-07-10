Dado(/^que realizo uma consulta na api de cep$/) do
  @uri = "http://viacep.com.br/ws/"
end

Quando(/^informo um cep valido$/) do
  @url = @uri + CEP["cep"]["valido"]
  @response = HTTParty.get(@url)
end

Quando(/^informo um cep com caracteres alfabéticos$/) do
  @url = @uri + CEP["cep"]["letras"]
  @response = HTTParty.get(@url)
end

Quando(/^informo um cep com menos caracteres$/) do
  @url = @uri + CEP["cep"]["menos_numeros"]
  @response = HTTParty.get(@url)
end

Quando(/^informo um cep com mais caracteres$/) do
  @url = @uri + CEP["cep"]["mais_numeros"]
  @response = HTTParty.get(@url)
end

Quando(/^informo um cep com caracteres especiais$/) do
  @url = @uri + CEP["cep"]["caracter_especial"]
  @response = HTTParty.get(@url)
end

Quando(/^informo um cep em branco$/) do
  @url = @uri + CEP["cep"]["branco"]
  @response = HTTParty.get(@url)
end

Quando(/^informo um cep inexistente$/) do
  @url = @uri + CEP["cep"]["inexistente"]
  @response = HTTParty.get(@url)
end

Então(/^deve me retornar os dados do endereco$/) do
  puts @response.body
  CEP["cep"]["campos"].each{|cep| expect(@response.body).to include(cep)}
  expect(@response.code).to eq 200
end

Então(/^deve me retornar erro$/) do
  puts @response.body
  CEP["cep"]["campos"].each{|cep| expect(@response.body).to_not include(cep)}
  expect(@response.code).to eq 400
end

Então(/^deve me retornar uma mensagem de erro$/) do
  puts @response.body
  CEP["cep"]["campos"].each{|cep| expect(@response.body).to_not include(cep)}
  expect(@response.code).to eq 200
end
