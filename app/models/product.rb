class Product < ActiveRecord::Base
  belongs_to :company
  self.primary_key = "pid"
  validates :company_id, presence: true
  validates :description, presence: true
  validates :name, presence: true
  validates :price, presence: true
end
