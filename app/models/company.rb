class Company < ActiveRecord::Base
  has_many :products, dependent: :nullify
  has_many :stories, dependent: :nullify
  self.primary_key = "company_id"
end
