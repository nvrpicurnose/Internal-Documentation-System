class ProfilesController < ApplicationController
  def account
  	@user = current_user
  	@comments = @user.comments
  end
end
