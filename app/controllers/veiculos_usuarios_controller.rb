class VeiculosUsuariosController < UsuariosController
  before_action :set_veiculo, only: %i[ show edit update destroy ]
  skip_before_action :authenticate_user!, only: :index

  # GET /veiculos or /veiculos.json
  def index
    @veiculos = Veiculo.all
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_veiculo
      @veiculo = Veiculo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def veiculo_params
      params.require(:veiculo).permit(:nome, :cor, :qnt_passageiros, :placa, :valor, :marca_id, :foto)
    end
end
