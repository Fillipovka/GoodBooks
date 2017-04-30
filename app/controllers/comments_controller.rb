class CommentsController < ApplicationController
  before_action :load_commentable

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to current_user
    end
  end

  def destroy
    @comment = @commentable.find(params[:commentable_id])
    @comment.comments.destroy
  end

  private
    def comment_params
      params.require(:comment).permit(:comment_text)
    end

    def load_commentable
      resource, id = request.path.split('/')[1,2]
      @commentable = resource.singularize.classify.constantize.find(id)
    end
end
