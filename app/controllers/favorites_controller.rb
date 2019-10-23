class FavoritesController < ApplicationController
  
  before_action :require_user_logged_in
  
  def create
    post = Micropost.find(params[:post_id])
    current_user.favorite(post)
    flash[:success] = 'お気に入りに追加しました'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    post = Micropost.find(params[:post_id])
    current_user.cancel_favorite(post)
    flash[:success] = 'お気に入りを解除しました'
    redirect_back(fallback_location: root_path)
  end
end
