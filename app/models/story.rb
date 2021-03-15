class Story < ActiveRecord::Base
  belongs_to :company
  self.primary_key = "id"
  validates :description, presence: true
  validates :title, presence: true
end
