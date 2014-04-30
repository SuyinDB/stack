class VotesController < ApplicationController

	def create
		#find the right story
		@story = Story.find(params[:story_id])

		# actually create the vote
		@vote = @story.votes.new

		# save the IP address of the person voting
		@vote.ip_address = request.ip 

		if @vote.save 

			flash[:success] = "Thanks for voting"

			else

			flash[:error] = "You've already voted for this story"

		end


		redirect_to story_path(@story)

	end

end
