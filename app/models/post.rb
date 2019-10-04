class Post < ApplicationRecord
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    belongs_to :user
    validates :user_id, presence: true
    validates :title, length: { minimum: 3, maximum: 200}
    has_many :comments, dependent: :destroy
    paginates_per 3
end
