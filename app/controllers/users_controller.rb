class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts
  end

  def new
    @user = User.new

  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
    else
      render 'edit'
    end
  end

  def create
    secure_params = params.require(:user).permit(:name, :email,
                                                 :password, :password_confirmation)
    @user = User.new(secure_params)
    if @user.save
      flash[:success] = "Welcome to the Twitter App!"    # NEW LINE
      redirect_to @user   # NEW LINE
      # Handle a successful save.
    else
      render 'new'     # NEW LINE
    end
  end

  def edit
    @user = User.find(params[:id])
  end
 
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
