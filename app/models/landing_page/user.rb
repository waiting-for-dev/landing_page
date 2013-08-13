module LandingPage
  # A User who wants to be subscribed to the Landing Page
  class User < ActiveRecord::Base
    validates_presence_of :email
    validates_format_of :email,
      :with => /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/i,
      :message => 'The email is not valid'
    validates_uniqueness_of :email

    # Automaticly set the locale to the one used in the request
    before_create :set_locale

    # If Campaign Monitor is configured, add the user to the corresponding list
    after_save :add_to_campaign_monitor

    private
    def add_to_campaign_monitor
      if LandingPage.campaign_monitor_api_key && LandingPage.campaign_monitor_list_id
        CreateSend::Subscriber.add({api_key: LandingPage.campaign_monitor_api_key}, LandingPage.campaign_monitor_list_id, email, name, [{:Key => 'locale', :Value => locale}], true)
      end
    end

    def set_locale
      self.locale = I18n.locale.to_s
    end
  end
end
