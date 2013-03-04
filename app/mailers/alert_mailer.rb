class AlertMailer < ActionMailer::Base

  def system_alert(user = User.first)
    mail(:to => User.first.email, :bcc => User.last.email, :subject => "ALERT!", :from => "mastercontrol@mcp.hcpprod.com")
  end
  
  def new_user(user)
    @user = user
    #todo - figure out how to add group to bcc
    mail(:to => @user.email, :bcc => [User.first.email], :subject => "ALERT!", :from => "mastercontrol@mcp.hcpprod.com")
  end  
end
