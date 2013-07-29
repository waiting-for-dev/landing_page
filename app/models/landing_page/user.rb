module LandingPage
  class User < ActiveRecord::Base
    validates_format_of :email,
      :with => /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/i,
      :message => 'The email is not valid'
    validates_uniqueness_of :email,
      :message => 'The email has already been subscribed'

    after_save :add_to_campaign_monitor

    private
    def add_to_campaign_monitor
      if LandingPage.campaign_monitor_api_key && LandingPage.campaign_monitor_list_id
        CreateSend::Subscriber.add({api_key: LandingPage.campaign_monitor_api_key}, LandingPage.campaign_monitor_list_id, email, name, [], true)
      end
    end
  end
end
