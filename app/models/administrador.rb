class Administrador < ApplicationRecord
    include BCrypt

    def senha
        @senha ||= Password.new(senha_hash)
    end

    def senha=(new_password)
        @senha = Password.create(new_password)
        self.senha_hash = @senha
    end

    def self.login(login, senha)
        debugger
        administrador = Administrador.find_by(login: login)
        if administrador.present? && administrador.authenticate(senha)
            administrador
        else
            nil
        end
    end

    def self.login(login, senha)
        Administrador.find_by(login: login, senha: senha)
    end

    def authenticate(senha)
        if self.senha == senha
            true
        else
            false
        end
    end    
end
