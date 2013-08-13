module LandingPageHelper
  def subscribe_with name, email
    visit "/landing_page/"
    fill_in 'Name', with: name
    fill_in 'Email', with: email
    click_button 'Subscribe'
  end
end
