class User < ApplicationRecord
  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :posts, foreign_key: "author_id", dependent: :destroy

  devise :confirmable, :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
end
