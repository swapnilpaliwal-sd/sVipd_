class Story < ActiveRecord::Base
  belongs_to :company
  self.primary_key = "id"
  validates :merchant, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :product_title, presence: true
end
