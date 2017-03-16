class Topic < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :user

  mount_uploader :image, AvatarUploader

  has_many :comments, dependent: :destroy
end
