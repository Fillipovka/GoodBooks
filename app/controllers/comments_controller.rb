class CommentsController < ApplicationController

	def new
		@comment = Comment.new
	end
	
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build(comment_params)
		@comment.user = current_user
		if @comment.save
      redirect_to current_user
    end
	end

	def destroy
		@post = Post.find(params[:post_id])
		@post.comments.destroy
    redirect_to @user
	end

	private
		def comment_params
      params.require(:comment).permit(:text_comment)
		end
end
