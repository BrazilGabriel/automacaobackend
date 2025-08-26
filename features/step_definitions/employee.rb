Dado('que o usuario consulte informacoes de Funcionario') do
    @getlist = Employee_Requests.new
    @assert = Assertions.new
end

Quando('ele fizer a busca') do
    @list_employee = @getlist.find_employee
end

Entao('uma lista com os funcionarios deve retornar') do
 @assert.request_success(@list_employee.code, @list_employee.message)
end



Dado('que o usuario cadastre um novo usuario') do
    @create = Employee_Requests.new
    @assert = Assertions.new
end

Quando('ele enviar as informacoes do funcionario') do
    @create_employee = @create.create_employee(DATABASE[:name][:name7], DATABASE[:salary][:salary7], DATABASE[:age][:age7])
    puts(@create_employee)

end

Entao('esse funcionario sera cadastrado') do
    @assert.request_success(@create_employee.code, @create_employee.message)
    expect(@create_employee["status"]).to eql 'success'
    expect(@create_employee["message"]).to eql 'Successfully! Record has been added.'
    expect(@create_employee.parsed_response["data"]['employee_name']).to eql DATABASE[:name][:name7]
    expect(@create_employee.parsed_response["data"]['employee_salary']).to eql DATABASE[:salary][:salary7]
    expect(@create_employee.parsed_response["data"]['employee_age']).to eql DATABASE[:age][:age7]
end



Dado('que o usuario altere uma informacao de funcionario') do
    @request = Employee_Requests.new
    @assert = Assertions.new
end

Quando('ele enviar as alteracoes') do
    @employee = @request.find_employee
    sleep 60
    @update_employee = @request.update_employee(@employee['data'][0]['id'], DATABASE[:name][:name1], DATABASE[:salary][:salary1], DATABASE[:age][:age1])
    puts @update_employee
end

Entao('as informacoes serao alteradas') do
    @assert.request_success(@update_employee.code, @update_employee.msg)
    expect(@update_employee["status"]).to eql 'success'
    expect(@update_employee["message"]).to eql 'Successfully! Record has been updated.'
    expect(@update_employee.parsed_response["data"]['employee_name']).to eql DATABASE[:name][:name1]
    expect(@update_employee.parsed_response["data"]['employee_salary']).to eql DATABASE[:salary][:salary1]
    expect(@update_employee.parsed_response["data"]['employee_age']).to eql DATABASE[:age][:age1]
end


Dado('que o usuario queira apagar um funcionario') do
  @request = Employee_Requests.new
  @assert = Assertions.new
end

Quando('ele enviar a identificacao do funcionario') do
   @employee = @request.find_employee
   sleep 60
   @del_employee = @request.delete_employee(@employee['data'][0]['id'])
end

Entao('esse funcionario devera ser apagado') do
  @assert.request_success(@del_employee.code, @del_employee.msg)
  expect(@del_employee["status"]).to eql 'success'
  expect(@del_employee["data"]).to eql '1'
  expect(@del_employee["message"]).to eql 'Successfully! Record has been deleted'
end