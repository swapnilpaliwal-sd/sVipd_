class Story < ActiveRecord::Base
  validates :merchant, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :product_title, presence: true

end
