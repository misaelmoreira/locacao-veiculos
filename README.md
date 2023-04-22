# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

 
# Bootstrap generator
gem 'bootstrap-generators', '~> 3.3.4'
gem 'record_tag_helper', '~> 1.0'


# Configurando o idioma rails 
Entrar na pasta config -> aplication.rb 
    config.i18n.default_locale = :"pt-BR"
    config.time_zone = "Brasilia"

# Configurar restante dos nome
pasta lib -> templates -> scaffold

# Form
Reserva.create(veiculo_id: Veiculo.first.id, cliente_id: Cliente.first.id, tempo_de_espera: 10, valor_alugado: 310, reservado_de: Time.now, reservado_ate: Time.now + 3.days, pagamento_no_destino: true)