# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts " =========== Criando Admnistrador ======================="
Administrador.create(nome: "teste", login: "teste@teste.com", senha: "123")
puts " =========== Admnistrador Criado ======================="

puts " =========== Criando Usuario ======================="
Usuario.create(nome: "teste", cpf: "999.999.999-99", cep: "15110-000", endereco: "Leocadia", numero: 123, estado: "SP", login: "misael@teste.com", senha: "123", cidade: "campinas", complemento: "bl01", data_nascimento: "12/02/2000", bairro: "Vossoroca")
puts " =========== Usuario Criado ======================="

puts " =========== Criando Marcas e Veiculos ======================="
if marca = Marca.create(nome: "Hyundai")
    Veiculo.create(nome: "HB20", cor: "Preto", qnt_passageiros: 5, placa: "HPP-4510", valor: 120, marca_id: marca.id)
end

if marca = Marca.create(nome: "Ford")
    Veiculo.create(nome: "Escort", cor: "Branco", qnt_passageiros: 5, placa: "PPP-4510", valor: 100, marca_id: marca.id)
end

if marca = Marca.create(nome: "Volkswagen")
    Veiculo.create(nome: "Fusca", cor: "Rosa", qnt_passageiros: 5, placa: "PYY-4510", valor: 90, marca_id: marca.id)
end
puts " =========== Marcas e Veiculos Criados ======================="
