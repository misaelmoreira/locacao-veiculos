class Reserva < ApplicationRecord
  belongs_to :veiculo
  belongs_to :usuario

  STATUS = {
    criando: 'Criando pedido',
    aguardando: 'Aguardando pagamento',
    pago: 'Pago',
    transporte: 'Em transporte',
    entregue: 'Entregue',
    cancelado: 'Cancelado',
    expirado: 'Expirado'
  }
end
