class TopController < ApplicationController
  def index
    @users = User.all
  end

  before_action :authenticate_user!
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
     @topics=Topic.all
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

   before_action do
     @conversation = Conversation.find(params[:conversation_id])
   end

   def index
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

     @message = @conversation.messages.build
   end

   def create
     @message = @conversation.messages.build(message_params)
     if @message.save
       redirect_to conversation_messages_path(@conversation)
     end
   end



 private
    def topics_params
      params.require(:topic).permit(:title, :content, :image)
    end

    def set_topic
          @topic = Topic.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:body, :user_id)
    end

end
