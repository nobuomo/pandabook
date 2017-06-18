
class CommentsController < ApplicationController

  def create
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.build(comment_params)
    @comment.user_id = current_user

    if @comment.save
      respond_to do |format|
        format.js { render :index }
      end
    else
      respond_to do |format|
        format.js { render :form }
      end
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @comment = Comment.find(params[:id])
    respond_to do |format|
      format.js { render :edit, locals: { topic: @topic } }
    end
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    if @comment.save
      respond_to do |format|
        format.js { render :index }
      end
    else
      respond_to do |format|
        format.js { render :form }
      end
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @comment = Comment.find(params[:id])
    if @comment.destroy
      respond_to do |format|
        format.js { render :index }
      end
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end
end
