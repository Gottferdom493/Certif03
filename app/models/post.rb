class Post < ApplicationRecord
  validates :titre, :sujet, :url, presence: true
end
