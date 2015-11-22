class CreateInterestTagUserJoinTable < ActiveRecord::Migration
  def change
  	create_table :interest_tags_users, :id=>false do|t|
  	    t.integer :user_id
        t.integer :interest_tag_id
        end 

  end
end
