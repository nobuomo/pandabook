module RelationshipsHelper
  def followed_by_current_user?(user,current_user)
    user.followers.exists?(id:current_user.id)
  end

  def followed_by_other_user?(user,current_user)
    user.followed_users.exists?(id:current_user.id)
  end
end
