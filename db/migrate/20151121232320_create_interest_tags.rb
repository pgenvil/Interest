	class CreateInterestTags < ActiveRecord::Migration
  def change
    create_table :interest_tags do |t|
      t.string :name
      t.integer :sort_id

      t.timestamps null: false
    end
  end
end
