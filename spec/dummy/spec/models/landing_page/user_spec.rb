require 'spec_helper'

module LandingPage
  describe User do
    it "has email attribute" do
      expect(User.new).to respond_to :email
    end
    describe "email" do
      it "is required" do
        expect(User.new).to validate_presence_of(:email)
      end
      it "is a valid email address" do
        expect(User.new).to allow_value("dummy@mail.com").for(:email)
        expect(User.new).to_not allow_value("invalid_email").for(:email)
      end
      it "is unique" do
        expect(User.new).to validate_uniqueness_of(:email)
      end
    end
    it "has name attribute" do
      expect(User.new).to respond_to :name
    end
    it "has locale attribute" do
      expect(User.new).to respond_to :locale
    end
    describe "after save" do
      context "when campaign monitor is configured" do
        it "add the email to campaign monitor" do
          LandingPage.campaign_monitor_api_key = 'whatever'
          LandingPage.campaign_monitor_list_id = 'whatever'
          name = 'dummy name'
          email = 'dummy@email.com'
          CreateSend::Subscriber.should_receive(:add).with({api_key: LandingPage.campaign_monitor_api_key}, LandingPage.campaign_monitor_list_id, email, name, [], true).and_return(nil)
          FactoryGirl.create :user, name: name, email: email
        end
      end
    end
  end
end
