class FavoritesController < ApplicationController
  
  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)
    authorize favorite
    
    if favorite.save
      flash[:notice] = "You have favorited this post."
      redirect_to [post.topic, post]
    else
      flash[:danger] = "There was an error favoriting post."
      redirect_to [post.topic, post]
    end
  end
  
  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find(params[:id])
    authorize favorite
    
    if favorite.destroy
      flash[:notice] = "Unfavorited post."
      redirect_to [post.topic, post]
    else
      flash[:danger] = "There was a problem unfavoriting post"
      redirect_to [post.topic, post]
    end
  end
end
