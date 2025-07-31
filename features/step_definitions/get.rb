Dado('que o usuario consulte informacoes de Funcionario') do
    @get_url = 'http://dummy.restapiexample.com/api/v1/employees'
end

Quando('ele fizer a busca') do
    @list_employee = HTTParty.get(@get_url)
end

Entao('uma lista com os funcionarios deve retornar') do
    expect(@list_employee.code).to eql 200
    expect(@list_employee.message).to eql 'OK'
end