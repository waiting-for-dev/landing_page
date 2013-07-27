module LandingPage
  class UsersController < ApplicationController
    def new
    end

    def create
      params.require(:user).permit!
      user = User.new(params[:user])
      if user.valid?
        flash[:success] = t('subscribed')
      else
        flash[:error] = t('subscription_error')
      end
      render :new
    end
  end
end
