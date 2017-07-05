class FollowedUsersController < ApplicationController
  def index
    binding.pry
    @followed_users = current_user.followed_users.all
  end
end
