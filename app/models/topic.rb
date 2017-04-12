class Topic < ActiveRecord::Base
  default_scope -> { order(created_at: :desc) }
  validates :title, presence: true
  belongs_to :user

  mount_uploader :image, AvatarUploader

  has_many :comments, dependent: :destroy
end
