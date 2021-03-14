class Story < ActiveRecord::Base
  belongs_to :company
  self.primary_key = "id"
end
