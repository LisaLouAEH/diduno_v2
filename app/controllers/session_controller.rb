class SessionController < ApplicationController
  def new
  end
  def create 
    @user = User.find_by(email: params[:session][:email])
    render 'new'
  end
  def destroy 
  end
end
