class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|

    	# adding some columns to the database
    	t.string :title 
    	t.string :description
    	t.string :link	

      t.timestamps
    end
  end
end
