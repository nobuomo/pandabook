class TopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
     @topics=Topic.all
     respond_to do |format|
      format.html
      format.js
      end
  end

  def show
     @comment = @topic.comments.build
     @comments = @topic.comments
  end

   def new
       if params[:back]
         @topic = Topic.new(topics_params)
       else
         @topic = Topic.new
       end
    end


   def create
     @topic=Topic.create(topics_params)
     @topic.user_id = current_user.id

     if @topic.save
          redirect_to topics_path, notice: "作成しました！"
          NoticeMailer.sendmail_topic(@topic).deliver
        else
          render 'new'
        end
   end

   def edit
   end

   def update
        @topic.update(topics_params)
        redirect_to topics_path, notice: "編集しました！"
   end

   def destroy
          @topic.destroy
          redirect_to topics_path, notice: "削除しました！"
   end

 private
    def topics_params
      params.require(:topic).permit(:title, :content, :image)
    end

    def set_topic
          @topic = Topic.find(params[:id])
    end

end
