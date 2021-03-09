class Product < ActiveRecord::Base
  self.primary_key = "pid"
  self.company = nil
end
