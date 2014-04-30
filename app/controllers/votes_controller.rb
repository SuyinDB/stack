class VotesController < ApplicationController

	def create
		#find the right story
		@story = Story.find(params[:story_id])
		# actually create the vote
		@vote = @story.votes.new

		@vote.save 

		flash[:success] = "Thanks for voting"

		redirect_to story_path(@story)

	end

end
