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
    @alert = Alert.find(alert)
    @alert.notifiers.each do |person|
      mail(:to => User.find(person.first.to_i).email, :subject => "Alert! #{@alert.host} has failed!")
    end  
  end
end
