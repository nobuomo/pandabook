class TopController < ApplicationController

  before_action :authenticate_user!
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
     @topics=Topic.all
     @users = User.all
     @messages = @conversation.messages
        if @messages.length > 10
          @over_ten = true
          @messages = @messages[-10..-1]
        end

        if params[:m]
          @over_ten = false
          @messages = @conversation.messages
        end

        if @messages.last
          if @messages.last.user_id != current_user.id
            @messages.last.read = true
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
        # ログインユーザーに紐付けてインスタンス生成するためbuildメソッドを使用します。
        @comment = current_user.comments.build(comment_params)
        @topic = @comment.topic

        # クライアント要求に応じてフォーマットを変更
      respond_to do |format|
          if @comment.save
            format.html { redirect_to topic_path(@topic), notice: 'コメントを投稿しました。' }
            format.json { render :show, status: :created, location: @comment }
           # JS形式でレスポンスを返します。
            format.js { render :index }
          else
            format.html { render :new }
            format.json { render json: @comment.errors, status: :unprocessable_entity }
          end
       end

      @message = @conversation.messages.build(message_params)
      if @message.save
      redirect_to conversation_messages_path(@conversation)
      end
   end

   def edit
   end

   def confirm
     @topic = Topic.new(topics_params)
     render :new if @topic.invalid?
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

    def comment_params
      params.require(:comment).permit(:topic_id, :content)
    end

    def message_params
      params.require(:message).permit(:body, :user_id)
    end
 end
end
