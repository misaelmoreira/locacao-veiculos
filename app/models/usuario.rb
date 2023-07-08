class Usuario < ApplicationRecord
  include BCrypt
  has_many :reservas, dependent: :delete_all
  validates :nome, :cpf, :login, :senha, :data_nascimento, :endereco, :numero, :estado, :cidade, :complemento, :bairro,
            presence: true

  def encoded
    usuario = as_json
    usuario['id'] = JsonWebToken.encoded(usuario['id'])
    usuario
  end

  def senha
    @senha ||= Password.new(senha_hash)
  end

  def senha=(new_password)
    @senha = Password.create(new_password)
    self.senha_hash = @senha
  end

  def self.login(login, senha)
    usuario = Usuario.find_by(login: login)
    usuario if usuario.present? && usuario.authenticate(senha)
  end

  def authenticate(senha)
    self.senha == senha
  end

  def clear_cpf
    cpf.gsub('-', '').gsub('.', '')
  end
end
