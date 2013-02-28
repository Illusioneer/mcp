class AlertMailer < ActionMailer::Base

  def system_alert(user = User.first)
    mail(:to => User.first.email, :bcc => User.last.email, :subject => "ALERT!", :from => "mastercontrol@mcp.hcpprod.com")
  end
end
