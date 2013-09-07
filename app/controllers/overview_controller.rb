class OverviewController < ApplicationController

  def index
  	# If user is not signed in, redirect to home page
  	if !user_signed_in? 
  		redirect_to "/"
  	end

  	# If user has been authenticated with Twitter
  	omniauth = session[:omniauth];
  	@results = nil;
  	@search_term = "StackSocial"
  	if !omniauth.nil?
  		@authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
	  	Twitter.configure do |config|
			  config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
			  config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
			  config.oauth_token = omniauth.credentials.token
			  config.oauth_token_secret = omniauth.credentials.secret
			end

			if params[:search_term] && params[:search_term].strip != ""
				@search_term = params[:search_term].strip
			end
			@results = Twitter.search("#" + @search_term + " -rt", :count => 20).results
	  end	
  end

  def user
  	@handle = params[:handle]
  	@results = Twitter.search("from:" + @handle, :count => 20).results
  end

end
