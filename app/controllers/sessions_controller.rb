class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if !@user.nil?
      flash[:success] = "ログインしました"
      @user　い
    else
      flash[:false] = "エラーです"
     render 'new'
    end
  end

  def destroy
  end
end