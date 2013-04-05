module UsersHelper

  def render_active_toggle(user)
    if user.active?
      link_to('Suspend', suspend_user_path(user), class: "btn btn-mini btn-danger", method: :post) if can? :manage, user
    else
      link_to('Activate', activate_user_path(user), class: "btn btn-mini btn-success", method: :post) if can? :manage, user
    end
  end

  def render_user_badge
    link_to '#', class: 'dropdown-toggle', data: { toggle: 'dropdown' } do
      output = []
      output << image_tag("http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(current_user.email)}?s=17", class: 'img-rounded')
      output << current_user.name
      output << content_tag(:b, '', class: 'caret')
      output.join("&nbsp").html_safe
    end
  end

  def render_user_menu
    xhtml = Builder::XmlMarkup.new :target => out=(''), :indent => 2
    xhtml.div(class: "user-details pull-right") do |user_details|
      if signed_in?
        user_details.ul(class: 'nav') do |nav|
          nav.li(class: 'dropdown') do |li|
            li << render_user_badge
            li.ul(class: 'dropdown-menu') do |dropdown|
              dropdown.li { |x| x << link_to('Sign out', destroy_user_session_path, method: :delete) }
              dropdown.li(class: 'divider')
              dropdown.li { |x| x << link_to('Account', edit_user_registration_path) }
            end
          end
        end
      end
    end
    out.html_safe
  end

end
