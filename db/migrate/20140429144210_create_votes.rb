class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|

    	t.integer :story_id
    	# store IP address to prevent the same person voting lots of times..
    	t.string :ip_address

      t.timestamps
    end
  end
end
