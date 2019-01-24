class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :user_image_id, ImageUploader

         has_many :events, dependent: :destroy
         has_many :groupe_users, dependent: :destroy
         has_many :groups, through: :group_users
         has_many :group_comments, dependent: :destroy


  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      User.where(['search_number LIKE ?', "#{search}"])
    end
  end

end
