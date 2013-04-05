class UsersController < ApplicationController
  inherit_resources
  load_and_authorize_resource

  custom_actions member: [:activate, :suspend], collection: :invite

  def update
    update! { collection_url }
  end

  def activate
    resource.activate!
    redirect_to users_path, notice: "#{resource.name} activated"
  end

  def suspend
    resource.suspend!
    redirect_to users_path, notice: "#{resource.name} suspended"
  end

  def invite
    User.invite!(params[:user])
    redirect_to users_path, notice: "Invitation email sent to #{params[:user][:email]}"
  end

end
