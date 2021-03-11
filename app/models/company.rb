class Company < ActiveRecord::Base
  has_many :products, dependent: :nullify
  self.primary_key = "company_id"
end
