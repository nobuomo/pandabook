
class CommentsController < ApplicationController

  def create

    @comment = current_user.comments.build(comment_params)
    @topic = @comment.topic

    respond_to do |format|
      if @comment.save

        format.html { redirect_to topic_path(@topic), notice: 'コメントを投稿しました。' }

      else
        format.html { render :new }
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

    # def comment_params
    #       params.require(:comment).permit(:comment_id, :topic_id, :user_id, :content)
    # end

    def comment_params
          params.require(:comment).permit(:topic_id, :content)
    end

end
