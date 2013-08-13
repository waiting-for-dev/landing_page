module LandingPage
  # Manage interactions of users who want to subscribe
  class UsersController < ApplicationController
    # Show form to register a new user
    def new
      @user = User.new
    end

    # Register a new user or show errors
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
