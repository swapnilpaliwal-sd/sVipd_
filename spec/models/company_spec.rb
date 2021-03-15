require 'spec_helper'

RSpec.describe Company, :type => :model do
    describe 'location' do
        it "takes a user id and returns distance to merchants" do
            distances = Company.company_to_user_by_distance(5)
            expect(distances).to be_an_instance_of(Hash)
        end
    end
    it "is valid with valid attributes" do
        expect(Company.new).to be_valid
    end
    it "is not valid without a name" do
        auction = Company.new(name: nil)
        expect(auction).to_not be_valid
      end
    it "is not valid without a description"
end
 