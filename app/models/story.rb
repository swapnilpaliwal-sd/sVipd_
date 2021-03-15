class Story < ActiveRecord::Base
  belongs_to :company
  self.primary_key = "id"
  validates :company_id, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :title, presence: true
end
