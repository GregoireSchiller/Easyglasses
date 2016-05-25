class PagesController < ApplicationController
  def home
  end
  def onboarding
    @user = User.new
  end
end
