class LoginAdministradorController < ApplicationController
  layout 'login'
  # skip_before_action :verify_authenticity_token, only: :logar

  def login
    return unless cookies[:administrador].present?

    redirect_to '/administradors'
  end

  def logar
    administrador = Administrador.login(params[:login], params[:senha])
    return unless administrador.present?

    cookies[:administrador] = administrador.encoded['id']
    redirect_to '/administradors'
  end

  def logout
    cookies[:administrador] = nil
    redirect_to '/administrador/login'
  end
end
