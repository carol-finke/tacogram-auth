class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfully."
      redirect_to posts_path
    else
      flash[:alert] = "Invalid email or password."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out successfully."
    redirect_to login_path
  end
end
