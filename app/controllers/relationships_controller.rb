

class RelationshipsController < ApplicationController
    before_action :authenticate_user!
  #  respond_to :json

  def create
      @user = User.find(params[:relationship][:followed_id])
      current_user.follow!(@user)
      respond_with @user
      respond_to do |format|
        format.html
        format.json { render json: @user }
      end
      # redirect_with root_path
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    respond_with @user
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
    # redirect_with root_path
  end

  def followed_users
  @user = User.find(params[:relationship][:followed_id])

  end

  def followers
  @user = User.find(params[:relationship][:follow_id])
  end


end
