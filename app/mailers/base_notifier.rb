class BaseNotifier < ActionMailer::Base
  default sender: Rails.application.config.devise.mailer_sender
end
