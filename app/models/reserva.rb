class Reserva < ApplicationRecord
  belongs_to :veiculo
  belongs_to :cliente
end
