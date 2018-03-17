class Article < ActiveRecord::Base
  # checks to make sure that values are NOT nil, and length is within range
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
end