require 'rails_helper'
RSpec.describe Story, :type => :model do
    subject { described_class.new } # creates an ActiveRecord for Story with all nil fields
    it "is valid with valid attributes" do
        subject.company_id = 5
        subject.description = "Great music"
        subject.image = "http://www.image.com/"
        subject.title = "YYZ"
        expect(subject).to be_valid
    end
    it "is not valid without a company id" do
        subject.description = "Great music"
        subject.image = "http://www.image.com/"
        subject.title = "YYZ"
        expect(subject).to_not be_valid
    end
    it "is not valid without a company id" do
        subject.image = "http://www.image.com/"
        subject.title = "YYZ"
        subject.description = "Great music"
        expect(subject).to_not be_valid
    end
    it "is not valid without a description" do
            subject.company_id = "Rush"
            subject.image = "http://www.image.com/"
            subject.title = "YYZ"
            expect(subject).to_not be_valid
    end
    it "is not valid without a title" do
            subject.company_id = "Rush"
            subject.image = "http://www.image.com/"
            subject.description = "Great music"
            expect(subject).to_not be_valid
    end
end
 