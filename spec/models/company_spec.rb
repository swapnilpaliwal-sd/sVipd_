require 'spec_helper'

RSpec.describe Company, :type => :model do
    subject { described_class.new } # creates an ActiveRecord for Company with all nil fields
    describe 'location' do
        it "takes a user id and returns distance to merchants" do
            distances = Company.company_to_user_by_distance(5)
            expect(distances).to be_an_instance_of(Hash)
        end
    end
    it "is valid with valid attributes" do
        subject.name = "test"
        subject.description = "test description goes here"
        expect(subject).to be_valid
    end
    it "is not valid without a name" do
        subject.description = "test description goes here"
        expect(subject).to_not be_valid
    end
    it "is not valid without a description" do
        subject.name = "test"
        expect(subject).to_not be_valid
    end
end
 