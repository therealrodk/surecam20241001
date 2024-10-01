class StaticController < ApplicationController
  def index
    if user_signed_in?
      @posts = params[:view_all] == "true" ? Post.active.newest_first : @posts = current_user.posts.newest_first
    else
      @posts = Post.active.newest_first
    end
  end
end
