class LoginController < ApplicationController
  
  def sigin
  end

  def cadastrar
  end

  def login    
  end

  def logar
    usuario = Usuario.login(params[:login], params[:senha])    
    if usuario.present?
      cookies[:usuario] = usuario.id
      redirect_to '/'
    else
      render :login      
    end
  end

  def logout
    cookies[:usuario] = nil
    redirect_to "/"
  end
end
