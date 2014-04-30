class Story < ActiveRecord::Base

	# associations
	has_many :comments
	has_many :votes

	# to validate the data
	# :title is a symbol... a bit like absolulte in Excel?!
	# { } is a "hash" where you can enter some values for different options
	# validation messages are built into Rails, they can be overwritten here
	validates :title, presence: true, length: { minimum: 5 } 
	validates :description, presence: true
	validates :link, presence: true, uniqueness: { message: "has already been submitted" } 

end
