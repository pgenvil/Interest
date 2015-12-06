class StaticPagesController < ApplicationController
  def home
  	if logged_in?
            @micropost  = current_user.microposts.build
            @feed_items = current_user.feed
            @comment= current_user.comments.build
         end
  end

  def help
  end

  def about # NEW
    flash[:notice] = "Testing the flash"
  end

  def mycommentpost
    @commentposts=current_user.show_my_postcomment
    @comment=current_user.comments.build
  end
end
