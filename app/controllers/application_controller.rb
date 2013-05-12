class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  def authenticate_user
    unless session[:user_id]
      redirect_to(:controller=>"adm", :action=>"login")
      return false
    else
      #Define current_user como objeto do usuário atual
      @current_user = User.find session[:user_id]
      return true
    end
  end

  #Esse método previne o user de acessar a página de login sem estar deslogado
  def verify_login_state
    if session[:user_id]
            redirect_to posts_url
      return false
    else
      return true
    end
  end
end
