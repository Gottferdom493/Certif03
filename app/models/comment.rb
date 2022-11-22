class Comment < ApplicationRecord
  validates :content, :stars, presence: true

  belongs_to :post
end
