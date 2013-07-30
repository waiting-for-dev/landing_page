module LandingPage
  class User < ActiveRecord::Base
    validates_presence_of :email
    validates_format_of :email,
      :with => /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/i,
      :message => 'The email is not valid'
    validates_uniqueness_of :email

    before_create :set_locale
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
