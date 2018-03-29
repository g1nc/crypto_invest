class WelcomeController < ApplicationController
  before_action :authenticate_user!

  def index
 	@icos      = Ico.all
 	@user      = current_user
 	@user_icos = current_user.user_icos
  end
end
