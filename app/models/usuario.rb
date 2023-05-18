class Usuario < ApplicationRecord
    has_many :reservas, dependent: :delete_all
    def self.login(login, senha)
        Usuario.find_by(login:  login, senha: senha)
    end

    def clear_cpf
        cpf.gsub('-','').gsub('.','')
    end
end
