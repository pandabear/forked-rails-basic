class FacebookController < ApplicationController
  def index
    if session['access_token']
      @face='You are logged in! <a href="facebook/logout">Logout</a>'
    else
      @face='<a href="facebook/login">Login</a>'
    end
  end
  
  def login
    # generate a new oauth object with your app data and your callback url
    session['oauth'] ||= Koala::Facebook::OAuth.new(facebook_callback_path)
    # redirect to facebook to get your code
    redirect_to session['oauth'].url_for_oauth_code()
  end
  
  def logout
    session['oauth'] = nil
    session['access_token'] = nil
    redirect_to :root
  end
  
  #method to handle the redirect from facebook back to you
  def callback
    #get the access token from facebook with your code
    session[:access_token] = Koala::Facebook::OAuth.new(facebook_callback_path).get_access_token(params[:code]) if params[:code]
    redirect_to session[:access_token] ? root_path : facebook_path
  end

end
