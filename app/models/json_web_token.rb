class JsonWebToken
    JWT_SECRET = Rails.application.secrets.secret_key_base
    def self.encoded(usuario_id)
        JWT.encode({id: usuario_id}, JWT_SECRET, 'HS256')
    end

    def self.decode(usuario_id)
        decode = JWT.decode(usuario_id, JWT_SECRET, true, { algorithm: 'HS256'})[0]
    end
end