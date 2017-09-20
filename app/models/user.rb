class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar,
  :styles => { :medium => "300x300px>", :thumb => "100x100px>" },
  :default_url => "/assets/default-img.png"

  validates_attachment_content_type :avatar,
  :content_type => /\Aimage\/.*\Z/
  has_many :favorites
end
