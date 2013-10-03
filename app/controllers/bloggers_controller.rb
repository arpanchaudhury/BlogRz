class BloggersController < ApplicationController

  def show
    @blogger = Blogger.find_by(provider: params[:provider], nickname: params[:nickname])
  end

  def add_to_favorites
    blogger = current_blogger
    blogger.add_to_set(:favorites, params[:id])
    blogger.save!
    redirect_to :back
  end
  
  def remove_from_favorites
    blogger = current_blogger
    blogger.pull(:favorites, params[:id])
    blogger.save!
    redirect_to :back
  end
end
