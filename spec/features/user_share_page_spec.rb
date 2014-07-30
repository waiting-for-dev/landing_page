require 'spec_helper'

include LandingPageHelper

module LandingPage
  describe "User", type: :feature do
    context "when he leaves a valid email" do
      it "see share buttons" do
        subscribe_with 'Name', 'dummy@email.com'
        expect(page).to have_selector '.lp-share'
      end
    end
  end
end
