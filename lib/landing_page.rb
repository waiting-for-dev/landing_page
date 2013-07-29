require "landing_page/engine"
require "slim-rails"
require "createsend"

module LandingPage
  mattr_accessor :campaign_monitor_api_key, :campaign_monitor_list_id

  self.campaign_monitor_api_key = nil
  self.campaign_monitor_list_id = nil
end
