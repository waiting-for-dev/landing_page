module LandingPage
  class UsersController < ApplicationController
    def new
      @user = User.new
    end

    def create
      params.require(:user).permit!
      user = User.new(params[:user])
      if user.valid?
        user.save
        flash.now[:success] = t('landing_page.subscribed')
        render :create
      else
        @user = user
        render :new
      end
    end
  end
end
