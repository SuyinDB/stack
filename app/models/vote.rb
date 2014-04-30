class Vote < ActiveRecord::Base

	belongs_to :story, counter_cache: true

	# ip_address must be unique for each story 
	validates :ip_address, uniqueness: { scope: :story_id }

end
