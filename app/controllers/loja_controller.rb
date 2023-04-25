class LojaController < UsuariosController
  before_action :set_veiculo, only: [:aluguel, :alugar]
  
  def index
  end

  def aluguel
  end

  def alugar
    if params[:dias].present?
      dias = params[:dias]
      @valor_total = dias * @veiculo.valor
    end
    redirect_to '/confirmacao_pagamento'  
  end

  def confirmacao_pagamento
  end

  private
  def set_veiculo
    @veiculo = Veiculo.find(params[:id])
  end
end
