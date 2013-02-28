class AlertMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.alert_mailer.system_alert.subject
  #

  def system_alert(user = User.first)
    @booking = booking
    mail(:to => User.first.email, :bcc => user.each{|person| person.email}, :subject => "ALERT!", :from => "mastercontrol@mcp.hcpprod.com")
  end
end

end
