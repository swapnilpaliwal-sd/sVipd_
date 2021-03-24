require 'rails_helper'
RSpec.describe Product, :type => :model do

    
    describe 'location' do
        it "takes a list of products and returns distance to each" do
            products = Product.all
            Product.generate_distances(products, "4200 Fifth Ave, Pittsburgh, PA 15260")
            products.each do |p|
                expect(p.distance.nil?).to be false
            end
        end
    end


    subject { described_class.new } # creates an ActiveRecord for Story with all nil fields
    it "is valid with valid attributes" do
        subject.company_id = 5
        subject.description = "Great music"
        subject.name = "Swifter"
        subject.price = 5
        expect(subject).to be_valid
    end    
    it "is not valid without company id" do
        subject.description = "Great music"
        subject.name = "Swifter"
        subject.price = 5
        expect(subject).to_not be_valid
    end
    it "is not valid without price" do
        subject.company_id = 5
        subject.description = "Great music"
        subject.name = "Swifter"
        expect(subject).to_not be_valid
    end
    it "is not valid without name" do
        subject.company_id = 5
        subject.description = "Great music"
        subject.price = 5
        expect(subject).to_not be_valid
    end
    it "is not valid without description" do
        subject.company_id = 5
        subject.price = 5
        subject.name = "Swifter"
        expect(subject).to_not be_valid
    end

end
 