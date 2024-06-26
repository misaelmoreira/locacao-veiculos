class UsuariosController < ApplicationController
  layout 'usuarios'
  before_action :set_usuario, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[login logar login_api cadastrar new create]

  def authenticate_user!
    if request.format.json?
      render json: {}, status: :unauthorized unless user_authorized?
    elsif cookies[:usuario].present?
      usuario_id = cookies[:usuario]
      unless Usuario.find(usuario_id).present?
        redirect_to '/login'
        nil
      end
    else
      redirect_to '/login'
    end
  end

  def user_authorized?
    debugger
    if request.headers[:UsuarioToken].present?
      token = request.headers[:UsuarioToken]
      usuario_id = JsonWebToken.decode(token)['id']
      return true if Usuario.find(usuario_id).present?
    end
    false
  end

  # GET /usuarios or /usuarios.json
  def index
    @usuarios = Usuario.all
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
  end

  # GET /usuarios/1/edit
  def edit;end

  # POST /usuarios or /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params)

    respond_to do |format|
      if @usuario.save
        cookies[:usuarios] = @usuario.encoded["id"]
        format.html { redirect_to '/', notice: 'Usuario was successfully created.' }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuarios/1 or /usuarios/1.json
  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to '/', notice: 'Usuario was successfully updated.' }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1 or /usuarios/1.json
  def destroy
    @usuario.destroy

    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_usuario
    @usuario = Usuario.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def usuario_params
    params.require(:usuario).permit(
      :nome,
      :cpf,
      :endereco,
      :numero,
      :cep,
      :estado,
      :login,
      :senha,
      :cidade,
      :complemento,
      :data_nascimento,
      :bairro
    )
  end
end
