class StoriesController < ApplicationController

	# we want to add a list of all of the stories
	# in static websites, this is the index.html
	def index 

		# I want to pass some data to our html
		# this data may change, so it is variable
		# so we store the data in a variable
		@username = "suyin"

		# we want to store some stories in a list
		# in ruby, we call this an array
		# @stories = ["Google", "Facebook", "Twitter", "LinkedIn"] - is a fixed array
		# @stories = Story.all would get all stories ordered chronologically.. this orders them -
		# @stories = Story.order("votes_count desc, title asc")

		if params[:featured] == "yes"

			# where finds a list, find just finds one thing
			@stories = Story.where(is_featured: true).order("created_at desc")

		elsif params[:sort] == "recent" 

			#sort by recent
			@stories = Story.order("created_at desc, title asc")	

		else
		
			#sort by top 
			@stories = Story.order("votes_count desc, title asc")

		end


	end


	def show
		# user params to get extra info from forms and urls
		@story = Story.find(params[:id]) 

	end


	def new
		# this is our new story form - you need one of these "def ___ end" each time you add a new view in "stories"
	
		@story = Story.new	

	end

	def create
		# to add things to our database...
		@story = Story.new(story_params)

		# to save it to the database
		if @story.save 

			# confirmation flash to say save was successful
			flash[:success] = "Thanks for posting a new story"

			# take me back to the homepage after saving
			redirect_to root_path

		else 

			# show the new view again if save fails
			render "new"

		end	

	end


	def edit
		@story = Story.find(params[:id])
	end

	def update
		# this actually updates the db
		@story = Story.find(params[:id])
		
		#update this story based on the form params
		if @story.update(story_params)

			# confirmation flash to say update was successful
			flash[:success] = "You've updated your story"

			# take me back to the story show page after saving
			redirect_to story_path(@story)

		else

			# show the edit view again when update fails because of uniqueness validation
			render "edit"

		end

	end


	def destroy
		# find the right story as above through the url
		@story = Story.find(params[:id])

		# remove from the db
		@story.destroy

		# confirmation flash to say delete was successful
		flash[:success] = "You've deleted your story"

		# take me back to the homepage after saving
		redirect_to root_path

	end


	def story_params
		# to find the data from the form, whitelist for security
		# this is referenced within def create above
		params.require(:story).permit(:title, :description, :link) 

	end

end
