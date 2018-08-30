class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #Add Image
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.pn"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
