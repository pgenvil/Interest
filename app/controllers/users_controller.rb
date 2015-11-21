class UsersController < ApplicationController
before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
                                        :following, :followers]

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts
  end

  def new
    @user = User.new

  end

  def viewinterest
     
   end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
    else
      render 'edit'
    end
  end
  
   def index
    @users = User.paginate(page: params[:page])
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
  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

 
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
