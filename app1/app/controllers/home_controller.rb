class HomeController < ApplicationController
  before_action :get_login_user
  
  def index
    @posts = []
    unless @login_user.nil?
      follows = Follow.where(user_id: @login_user.id)
      posts_user_ids = follows.map(&:following_user_id).push(@login_user.id)
      @posts = Post.where(user_id: posts_user_ids)
      @posts = @posts.order("created_at DESC")
    end
  end
  
end
