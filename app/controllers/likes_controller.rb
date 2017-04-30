class LikesController < ApplicationController
  def like
    @post = Post.find(params[:post_id])
    current_user.like(@post)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def dislike
    @post = Like.find(params[:id]).post
    current_user.dislike(@post)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end
