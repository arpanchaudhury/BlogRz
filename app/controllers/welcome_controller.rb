class WelcomeController < ApplicationController
  def index
    if blogger_signed_in?
      redirect_to posts_path
    else
      @blogger = Blogger.new
    end
  end
end
