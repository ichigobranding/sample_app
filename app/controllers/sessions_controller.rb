class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash.now[:success] = "ログインしました"
      # todo    log_in @user 追加した
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      flash.now[:danger] = "エラーです"
      render 'new'
    end
  end

  # Delete /logout
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end