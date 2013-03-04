class AlertMailer < ActionMailer::Base

  def system_alert(user = User.first)
    mail(:to => User.first.email, :bcc => User.last.email, :subject => "ALERT!", :from => "mastercontrol@mcp.hcpprod.com")
  end
  
  def new_user(user)
    layout :new_user
    mail(:to => user.email, :bcc => [User.first.email,User.last.email], :subject => "ALERT!", :from => "mastercontrol@mcp.hcpprod.com")
  end  
end
