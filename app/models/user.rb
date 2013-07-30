class User < ActiveRecord::Base
	has_many :tweets
	validates :name, presence: true
	validates :email, presence: true
	validates :password, presence: true
	validates :handle, presence: true
	mount_uploader :avatar, AvatarUploader

end
