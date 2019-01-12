class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :user_image_id, ImageUploader

         has_many :events, dependent: :destroy
         has_many :group_users, dependent: :destroy
end
