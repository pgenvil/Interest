class ActivitiesController < ApplicationController
 before_action :logged_in_user, only: [:create,:destroy]
  def  index
  	  @activities=Activity.all
  end

  def show

  end

  def create
  	 secure_post = params.require(:activity).permit(:title,:location,:content)

     @activity=current_user.activities.build( secure_post)
     if @activity.save
          flash[:success] = "activity created!"
          redirect_to activities_path
      else
      	 render'create'  
      	end
 end 	

  def new
      @activity=Activity.new
 end

  def destroy
       @activity= current_user.activities.find_by(id: params[:id])
       @activity.destroy

        redirect_to activities_path
  end

  def correct_user
     @activity= current_user.activities.find_by(id: params[:id])
      redirect_to index if @activity.nil?
            end
  
end