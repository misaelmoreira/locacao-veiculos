class Usuario < ApplicationRecord
    has_many :reservas, dependent: :delete_all
    include BCrypt

    def senha
        @senha ||= Password.new(senha_hash)
    end

    def senha=(new_password)
        @senha = Password.create(new_password)
        self.senha_hash = @senha
    end

    def self.login(login, senha)
        usuario = Usuario.find_by(login: login)
        if usuario.present? && usuario.authenticate(senha)
            usuario
        else
            nil
        end
    end

    def authenticate(senha)
        if self.senha == senha
            true
        else
            false
        end
    end

    def clear_cpf
        cpf.gsub('-','').gsub('.','')
    end
end
