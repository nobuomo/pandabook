

class RelationshipsController < ApplicationController
    before_action :authenticate_user!
    respond_to :js

  def create
      @user = User.find(params[:relationship][:followed_id])
      current_user.follow!(@user)
      respond_with @user
      redirect_to root_path
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    respond_with @user
    redirect_to root_path
  end

def followed_users
@user = User.find(params[:relationship][:followed_id])

end

def followers
@user = User.find(params[:relationship][:follow_id])
end


end
