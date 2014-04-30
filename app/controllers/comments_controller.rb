class CommentsController < ApplicationController

	def new
		# need to find the story that the comment will be on 
		# needs to specify story_if since we're in the comments controller
		@story = Story.find(params[:story_id])
		# make a new comment on the @story variable
		@comment = @story.comments.new
	end

	def create
		@story = Story.find(params[:story_id])
		@comment = @story.comments.new(comment_params)

		if @comment.save

			flash[:success] = "Thanks for posting a comment"

			# take me back to the homepage after saving
			redirect_to story_path(@story)

		else

			render "new"

		end

	end

	def comment_params
		# whitelisted form data
		params.require(:comment).permit(:body) 
	end

end
