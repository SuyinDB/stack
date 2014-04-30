class Comment < ActiveRecord::Base

	# association
	# updates story table with count 
	belongs_to :story, counter_cache: true

	validates :body, presence: true

end
