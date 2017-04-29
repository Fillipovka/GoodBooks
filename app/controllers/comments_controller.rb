class CommentsController < ApplicationController
	before_action :load_commentable

	def new
		@comment = @commentable.comments.new
	end
	
	def create
		@comment = @commentable.comments.new(comment_params)
		if @comment.save
      redirect_to current_user
    end
	end
	

	private
		def comment_params
      params.require(:comment).permit(:text_comment, :current_user)
		end

		def load_commentable
	    resource, id = request.path.split('/')[1,2]
	    @commentable = resource.singularize.classify.constantize.find(id)
  	end
end
