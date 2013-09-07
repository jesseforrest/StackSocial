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
  		#@authentications = current_user.authentications;
  		@authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
	  	logger.debug "omni access token" + omniauth.credentials.token
	  	logger.debug "omni access secret" + omniauth.credentials.secret
	  	Twitter.configure do |config|
			  config.consumer_key = 'edLsNlqzeEfHWuQ7EB1GA'
			  config.consumer_secret = 'EeRyCvwyb3bBOkraf6pblZrM7Tm6vpCGXT90u5O7VmU'
			  config.oauth_token = omniauth.credentials.token
			  config.oauth_token_secret = omniauth.credentials.secret
			end

			@search_term = params[:search_term] if params[:search_term]
			@results = Twitter.search("#" + @search_term + " -rt", :count => 20).results
	  end	
  end

end
