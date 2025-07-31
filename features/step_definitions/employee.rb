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

Dado('que o usuario cadastre um novo usuario') do
    @post_url ='http://dummy.restapiexample.com/api/v1/create'
end

Quando('ele enviar as informacoes do funcionario') do
    @create_employee = HTTParty.post(@post_url, :headers => {'Content-Type': 'application/json'}, body: {
        "employee_name": "Gabriel Brasil",
        "employee_salary": 540800,
        "employee_age": 32,
        "profile_image": ""
    }.to_json)

end

Entao('esse funcionario sera cadastrado') do
    expect(@create_employee.code).to eql (200)
    expect(@create_employee.msg).to eql 'OK'
    expect(@create_employee["status"]).to eql 'success'
    expect(@create_employee["message"]).to eql 'Successfully! Record has been added.'
    expect(@create_employee.parsed_response["data"]['employee_name']).to eql 'Gabriel Brasil'
    expect(@create_employee.parsed_response["data"]['employee_salary']).to eql (540800)
    expect(@create_employee.parsed_response["data"]['employee_age']).to eql (32)
end

Dado('que o usuario altere uma informacao de funcionario') do
    @put_url = 'http://dummy.restapiexample.com/api/v1/update/10'
end

Quando('ele enviar as alteracoes') do
@update_employee = HTTParty.put(@put_url, :headers => {'Content-Type': 'application/json'}, body: {
        "employee_name": "Joao",
        "employee_salary": 840800,
        "employee_age": 30,
        "profile_image": ""
    }.to_json)

    puts(@update_employee)

end

Entao('as informacoes serao alteradas') do
    expect(@update_employee.code).to eql (200)
    expect(@update_employee.msg).to eql 'OK'
    expect(@update_employee["status"]).to eql 'success'
    expect(@update_employee["message"]).to eql 'Successfully! Record has been updated.'
    expect(@update_employee.parsed_response["data"]['employee_name']).to eql 'Joao'
    expect(@update_employee.parsed_response["data"]['employee_salary']).to eql (840800)
    expect(@update_employee.parsed_response["data"]['employee_age']).to eql (30)  
end