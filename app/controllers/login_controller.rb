class LoginController < ApplicationController
  def sigin; end

  def cadastrar; end

  def login; end

  def login_pagamento
    return unless params[:dias].present? && params[:token].present? && params[:senderHash].present?
    @dias = params[:dias].to_i
    @token_pagamento = params[:token]
    @hash_comprador = params[:senderHash]
  end

  def login_api
    usuario = Usuario.login(login_params[:login], login_params[:senha])
    if usuario.present?
      render json: { usuario: usuario.encoded }, status: :ok
    else
      render json: { status: 'Não tem permissao' }, status: unauthorized
    end
  end

  def logar
    usuario = Usuario.login(params[:login], params[:senha])

    if usuario.present?
      if usuario.senha == params[:senha]
        cookies[:usuario] = usuario.encoded["id"]
        redirect_to '/'
        return
      end
      render :login
    end
  end

  def logout
    cookies[:usuario] = nil
    redirect_to '/'
  end

  private

  def login_params
    params.require(:usuario).permit(:login, :senha)
  end
end
