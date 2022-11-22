class Post < ApplicationRecord
  validates :titre, :sujet, :url, presence: true

  has_many :comments, dependent: :destroy
end
