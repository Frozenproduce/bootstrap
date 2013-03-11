# Since Bundler doesn't work when just relying on engine Gemspecs,we have to explitly define our gems for this engine
require 'devise'
require 'devise_invitable'
require 'rolify'
require 'simple_form'
require 'cancan'
require 'twitter-bootstrap-rails'
require 'inherited_resources'
require 'simple-navigation'
require 'state_machine'
require 'builder'
require 'jquery-rails'

module Bootstrap
  class Engine < ::Rails::Engine
     %W(#{config.root}/lib).tap do |paths|
      config.autoload_paths += paths
      config.eager_load_paths += paths
    end

    config.bootstrap = ActiveSupport::OrderedOptions.new

    SimpleNavigation::config_file_paths << "#{config.root}/config"

    config.to_prepare do
      Devise::SessionsController.layout "standalone"
      Devise::RegistrationsController.layout proc{ |controller| user_signed_in? ? "application" : "standalone" }
      Devise::ConfirmationsController.layout "standalone"
      Devise::UnlocksController.layout "standalone"
      Devise::PasswordsController.layout "standalone"
      Devise::InvitationsController.layout "standalone"
    end

    config.after_initialize do |app|
      config.bootstrap.page_title = app.railtie_name.gsub('_application', '').titleize
      config.bootstrap.company = app.railtie_name.gsub('_application', '').titleize
    end

  end
end
