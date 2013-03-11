# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  # Specify a custom renderer if needed.
  # The default renderer is SimpleNavigation::Renderer::List which renders HTML lists.
  # The renderer can also be specified as option in the render_navigation call.
  # navigation.renderer = Your::Custom::Renderer
  navigation.selected_class = 'active'

  navigation.items do |primary|
    primary.dom_class = 'nav'
    primary.item :users, 'Users', users_path, highlights_on: :subpath, if: ->{ can? :manage, User } do |user|
      user.dom_class = "nav nav-list well"
      user.item :new, 'Invite new user', new_user_path, if: -> { can? :create, User }
    end
  end

end
