class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :blog_articles,  dependent: :destroy

  validates :fname, presence: true
  validates :lname, presence: true

  ratyrate_rater
end
