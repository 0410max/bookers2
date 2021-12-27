class Book < ApplicationRecord
  belongs_to :user

  validates :book_title, presence: true
  validates :opinion, presence: true,length: {maximum: 200}
end
