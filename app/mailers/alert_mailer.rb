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
  
  def notification(person,alert)
    logger.info("SENDING EMAILS TO THE USER: #{alert.inspect}")
    logger.info("SENDING EMAILS FOR THE ALERT: #{person.inspect}")
    @alert = alert
    @person = person
    mail(:to => User.find(@person.first.to_i).email, :subject => "Alert! #{@alert.host} has failed!")
  end
  
  def blocked(alert)
      mail(:to => User.find(alert[:id].to_i).email, :subject => "You are now blocking #{Alert.find(alert[:alert].to_i).host}")
  end  
  
  def ignored(alert)
      mail(:to => User.find(alert[:id].to_i).email, :subject => "You are now ignoring #{Alert.find(alert[:alert].to_i).host}")
  end  
  
  def acknowledged(person, notified, acknowledger)
  @person = person
  @acknowledger = acknowledger 
  logger.info("SENDING EMAILS TO THE USER: #{@person.inspect}")
    mail(:to => User.find(notified.first.to_i).email,:subject => "Notice: #{User.find(@acknowledger.to_i).fullname} has acknowledged #{@person.host}")
  end  
end