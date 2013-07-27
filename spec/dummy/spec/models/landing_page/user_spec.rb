require 'spec_helper'

module LandingPage
  describe User do
    it "has email attribute" do
      expect(User.new).to respond_to :email
    end
    describe "email" do
      it "is a valid email address" do
        expect(User.new).to allow_value("dummy@mail.com").for(:email)
        expect(User.new).to_not allow_value("invalid_email").for(:email)
      end
      it "is unique" do
        expect(User.new).to validate_uniqueness_of(:email).with_message('The email has already been subscribed')
      end
    end
    it "has name attribute" do
      expect(User.new).to respond_to :name
    end
  end
end
