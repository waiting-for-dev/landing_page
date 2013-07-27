module LandingPage
  class UsersController < ApplicationController
    def new
    end

    def create
      params.require(:user).permit!
      user = User.new(params[:user])
      if user.valid?
        user.save
        flash.now[:success] = t('subscribed')
        render :new
      else
        @errors = user.errors
        render :new
      end
    end
  end
end
