
class CommentsController < ApplicationController

  def create

    @comment = current_user.comments.build(comment_params)
    @topic = @comment.topic

    respond_to do |format|
      if @comment.save
        format.html { redirect_to topic_path(@topic), notice: 'コメントを投稿しました。' }
        format.js { render :index }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @comment = Comment.find(params[:id])

  end

  def update
    @topic = Topic.find(params[:topic_id])
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to topic_path(@topic), notice: 'コメントを編集しました。' }
      end
    else
      respond_to do |format|
        format.js { render :index }
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

  def show
  end

  private

    def comment_params
          params.require(:comment).permit(:topic_id, :content)
    end

end
