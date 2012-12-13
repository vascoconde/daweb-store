class SessionsController < ApplicationController
  def new
  	
  end

  def create
  	user = User.find_by_username(params[:username])
  	if user && user.password == params[:password]
  		session[:user_id] = user.id
  		redirect_to root_url, notice: "Log In com sucesso! Pode agora comprar tudo o que quiser."
  	else
  		flash[:alert] = "Email ou a Password nao sao validos"
  		render "new"
  	end
  end
end
