class AlertMailer < ActionMailer::Base

  default :from => "mastercontrol@mcp.hcpprod.com"
  
  def system_alert(user = User.first)
    @user = user
    mail(:to => @user.email, :bcc => User.first.email, :subject => "ALERT!")
  end
  
  def new_alert(alert)
    @alert = Alert.find(alert)
    mail(:to => User.first.email, :bcc => User.find(alert.notifiers.keys.collect{|i| i.to_i}).map(&:email), :subject => "You have created a new alert.")
  end  

  def new_user(user)
    @user = user
    #todo - figure out how to add group to bcc
    mail(:to => @user.email, :bcc => User.first.email, :subject => "This email has been added to the MCP", :from => "mastercontrol@mcp.hcpprod.com")
  end  
  
  def notification(alert)
    User.find(alert.notifiers.keys.collect{|i| i.to_i}).map(&:email)
    @alert = Alert.find(alert)
    mail(:to => User.first.email, :bcc => User.last.email, :subject => "You have created a new alert.")
  end
end
