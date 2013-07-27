module LandingPage
  class User < ActiveRecord::Base
    validates_format_of :email,
      :with => /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/i,
      :message => 'The email is not valid'
  end
end
