require "bootstrap/engine"

module Bootstrap
  extend self

  def config
    Rails.application.config.bootstrap
  end
end
