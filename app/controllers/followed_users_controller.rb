class FollowedUsersController < ApplicationController
  def index
    @followed_users = @user.followed_users.all
  end
end
