class Product < ActiveRecord::Base
  belongs_to :company
  self.primary_key = "pid"
  validates :company_id, presence: true
  validates :description, presence: true
  validates :name, presence: true
  validates :price, presence: true

  def self.search_by_companyid(products, cid, search)
    searched_products = products.where("company_id = ?", cid)
    searched_products = self.case_insensitive_search(searched_products, search)
    searched_products
  end

  def self.case_insensitive_search(products, search)
    if search.nil?
      return products
    end

    searched_products = products.where("LOWER (name) LIKE ?  OR LOWER( description ) LIKE ? ", "%#{search.downcase}%", "%#{search.downcase}%")
    searched_products
  end

  def self.search(products, search)
    searched_products = products.where("name LIKE ?  OR  description LIKE ? ", "%#{search}%")
    searched_products
  end

  def self.get_all_distances(products, loc)
    comp_dist = Company.company_to_current_user_by_distance(loc)
    prod_to_dist = Hash.new
    products.each do |p|
      if comp_dist[p.company.company_id].nil? == false
        prod_to_dist[p.pid] = comp_dist[p.company.company_id].round(2)
      end
    end
    prod_to_dist
  end
end
