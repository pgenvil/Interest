class InterestTagsController < ApplicationController
 before_action :logged_in_user, only: [:create,:destroy]
 before_action :correct_user,   only: :destroy  


def index
     @interest=InterestTag.all
end

def new
      @interest=InterestTag.new
 end

def create
	 secure_post = params.require(:interest_tag).permit(:name)
   @interest= current_user.interest_tags.build(secure_post) 
      if @interest.save
      	flash[:success] = "interest created!"
        redirect_to action: 'index', notice: 'interest was successfully created.'
      end  
end	

def destroy
       @interest.destroy
        redirect_to action: 'index', notice: 'interest was successfully destroy.'
 end 

   def correct_user
     @interest = current_user.interest_tags.find_by(id: params[:id])
      redirect_to root_url if @interest.nil?
    end


end	