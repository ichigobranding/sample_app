class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    #debugger
  end

  #GET /users/new
  def new
    @user = User.new
  end
  # POST /users + params
  def create
    @user = User.new(user_params)
    if @user.save
      #successu
      # GET "/users/#{@user.id}"
      log_in @user
      flash[:success] = "やったね！"
      redirect_to @user
      # =>redirect_to user_path(@user)
      # =>redirect_to user_path(@user.id)
      # =>redirect_to user_path(1) => /user/1
    else
      #failer
      render 'new'
    end
    # debugger
    #@user.save
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
