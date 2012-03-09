class ApplicationController < ActionController::Base
  # protect_from_forgery
 
  before_filter :parse_facebook_cookies
 def parse_facebook_cookies
  @facebook_cookies = Koala::Facebook::OAuth.new.get_user_info_from_cookie(cookies)
 end

  def index
    graph = Koala::Facebook::GraphAPI.new(@facebook_cookies["access_token"])
    @email = graph.get_connections("me", "email")
  end

end
