require 'spec_helper'

describe "User" do
  context "when he leaves a valid email" do
    it "see a success message" do
      visit "/landing_page/"
      fill_in 'Name', with: 'Name'
      fill_in 'Email', with: 'dummy@email.com'
      click_button 'Subscribe'
      expect(page).to have_selector '.message.message-success', text: 'You have been subscribed'
    end
  end
  context "when he leaves an invalid email" do
    it "see an error message" do
      visit "/landing_page/"
      fill_in 'Email', with: 'not_valid_email'
      click_button 'Subscribe'
      expect(page).to have_selector '.message.message-error', text: 'The email is not valid'
    end
  end
  context "when he leaves a repeated email" do
    it "see an error message" do
      FactoryGirl.create :user, email: 'dummy@email.com'
      visit "/landing_page/"
      fill_in 'Email', with: 'dummy@email.com'
      click_button 'Subscribe'
      expect(page).to have_selector '.message.message-error', text: 'The email has already been subscribed'
    end
  end
end
