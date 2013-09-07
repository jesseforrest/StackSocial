class WelcomeController < ApplicationController
  def index
  	# If user is signed in, redirect to overview
  	if user_signed_in? 
  		redirect_to "/overview"
  	end
  end
end
