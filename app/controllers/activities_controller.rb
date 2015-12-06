class ActivitiesController < ApplicationController
 before_action :logged_in_user, only: [:create,:destroy]
  def  index
  	  @activities=Activity.all
  end

  def show

  end

  def create
  	 secure_post = params.require(:activity).permit(:title,:content,:location_id)
      
     @activity=current_user.activities.new(secure_post)
    if (Location.find(params[:activity][:location_id])and
    @activity.save)
          flash[:success] = "activity created!"
          redirect_to action: 'index', notice: 'Activity was successfully created.'
      else
      	 render'new'  
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