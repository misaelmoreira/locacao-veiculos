class Administrador < ApplicationRecord
  include BCrypt
  validates :nome, :login, :senha, presence: true

  def encoded
    administrador = as_json
    administrador['id'] = JsonWebToken.encoded(administrador['id'])
    administrador
  end

  def senha
    @senha ||= Password.new(senha_hash)
  end

  def senha=(new_password)
    @senha = Password.create(new_password)
    self.senha_hash = @senha
  end

  def self.login(login, senha)
    administrador = Administrador.find_by(login: login)
    return unless administrador.present? && administrador.authenticate(senha)

    administrador
  end

  # def self.login(login, senha)
  #     Administrador.find_by(login: login, senha: senha)
  # end

  def authenticate(senha)
    self.senha == senha
  end
end
