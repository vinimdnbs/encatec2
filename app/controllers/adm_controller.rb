#encoding=UTF-8

class AdmController < ApplicationController
  before_filter :authenticate_user, :except=>[:login, :login_attempt, :logout]
  before_filter :verify_login_state, :only=>[:login, :login_attempt]

  def login
    @title = "II ENCATEC - Login"
  end

  def login_attempt
    @title = "II ENCATEC - Login"
    authorized_user = User.authenticate(params[:username],params[:password])

    if authorized_user
      session[:user_id] = authorized_user.id
      redirect_to posts_url
    else
      flash[:notice] = "Nome de usuário ou senha inválidos!"
      render "login"
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to :action => 'login'
  end
end
