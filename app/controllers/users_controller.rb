# class UsersController < ApplicationController
#   def index
#     @users = User.all
#   end
#
#
# end


class UsersController < ApplicationController
  def index
    @users = User.where.not(id: current_user.id)
  end

  def show
    @user = User.find(params[:id])
    @user.email = nil if @user.email.include?("@example.com")
    @topics = Topic.where(user_id: params[:id])
    @request_friend = @user.request_friend
  end
end
