class AuthTokensController < ApplicationController

  def create
    authorize! :update, current_user
    current_user.reset_authentication_token!
    redirect_to :back, notice: 'Token successfully created'
  end

  def destroy
    authorize! :update, current_user
    current_user.authentication_token = nil
    current_user.save
    redirect_to :back, notice: 'Token successfully deleted'
  end

end
