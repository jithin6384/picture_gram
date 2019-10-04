class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

    validates :user_name, presence: true, uniqueness: true, length: {minimum: 4, maximum: 17}
    has_attached_file :avatar, styles: { medium: "152x152>"} 
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_many :posts, dependent: :destroy
   has_many :comments, dependent: :destroy
   
end
