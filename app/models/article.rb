class Article < ApplicationRecord
  validates :title, :content, presence: { message: '%<attribute>s cannot be blank' }
  validates :title, uniqueness: true
end
