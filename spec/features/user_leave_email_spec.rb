require 'spec_helper'

include LandingPageHelper

module LandingPage
  describe "User", type: :feature do
    context "when he leaves a valid email" do
      it "see a success message" do
        subscribe_with 'Name', 'dummy@email.com'
        expect(page).to have_selector '.lp-message.lp-message-success', text: 'You have been subscribed'
      end
    end
    context "when he leaves an invalid email" do
      it "see an error message" do
        subscribe_with 'Name', 'not_valid_email'
        expect(page).to have_selector '.lp-message.lp-message-error', text: 'The email is not valid'
      end
    end
    context "when he leaves a repeated email" do
      it "see an error message" do
        FactoryGirl.create :user, email: 'dummy@email.com'
        subscribe_with 'Name', 'dummy@email.com'
        expect(page).to have_selector '.lp-message.lp-message-error', text: 'has already been taken'
      end
    end
  end
end
