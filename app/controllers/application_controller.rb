class ApplicationController < ActionController::Base
  before_filter :parse_facebook_cookies, :is_logged_to_facebook

  def parse_facebook_cookies
    @facebook_cookies ||= Koala::Facebook::OAuth.new.get_user_info_from_cookie(cookies)
  end

  def index
    @access_token = @facebook_cookies["access_token"]
    @graph = Koala::Facebook::API.new(@access_token)
  end

  private
  
  def is_logged_to_facebook
    if session['access_token']
      @face=true
    else
      @face=false
    end
  end
end
