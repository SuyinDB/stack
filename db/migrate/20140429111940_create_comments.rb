class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|

    	#to link comment table with a story
    	t.integer :story_id	

    	# save comment bodies as a paragraph, therefore not a string but a text column
    	t.text :body

      t.timestamps
    end
  end
end
