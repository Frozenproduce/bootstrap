class AdminNotifier < BaseNotifier

  def activate(user)
    @user = user
    administrators = User.with_role(:admin)
    return if administrators.blank?
    administrators.each do |admin|
      @administrator = admin
      mail(to: admin.email, subject: "#{user.name} requested to join #{Bootstrap.config.page_title}")
    end
  end

end
