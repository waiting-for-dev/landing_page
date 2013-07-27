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
    end
  end
end
