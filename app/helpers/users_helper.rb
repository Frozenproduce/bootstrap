module UsersHelper

  def render_active_toggle(user)
    if user.active?
      link_to('Suspend', suspend_user_path(user), class: "btn btn-mini btn-danger", method: :post) if can? :manage, user
    else
      link_to('Activate', activate_user_path(user), class: "btn btn-mini btn-success", method: :post) if can? :manage, user
    end
  end

end
