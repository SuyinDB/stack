class AddNewFeaturesToStory < ActiveRecord::Migration
  def change
  	
  	#add columns to the stories table
  	add_column :stories, :is_featured, :boolean, default: false
  	add_column :stories, :comments_count, :integer
  	add_column :stories, :votes_count, :integer

  end
end
