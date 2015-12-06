class CommentsController < ApplicationController
	before_action :logged_in_user
  before_action :correct_user,   only: :destroy  



	def create
        secure_post = params.require(:comment).permit(:content,:user_id,:micropost_id)
        @comment = current_user.comments.build(secure_post) 
        if @comment.save
          flash[:success] = "Your commit has been created!"
          redirect_to root_url
        else
          render 'static_pages/home'
        end
      end

      def destroy
            @comment.destroy
            redirect_to root_url
      end

       

      def correct_user
              @comment = current_user.comments.find_by(id: params[:id])
              redirect_to root_url if @comment.nil?
            end

            
end
