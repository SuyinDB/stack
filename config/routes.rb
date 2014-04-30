Rails.application.routes.draw do
  
  # active admin added these lines for me
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

	# adding ability to add, edit and delete stories
	# there are 7 default actions in Rails - 
	# index, show, 
	# new, create, 
	# edit, update 
	# and destory
	resources :stories do
		# comments are related to stories 
		# so the URLs will be related too
		# this is a nested resource
		resources :comments
		resources :votes
	end

  # set up a URL for the homepage (root)
  root "stories#index"

end