class Alert < ActiveRecord::Base
  attr_accessible :host, :name, :notifiers, :startdate, :stopdate, :trigger
  serialize :notifiers, ActiveRecord::Coders::Hstore
    
  def self.http_check
    OFFSET = (trigger * 5)+245
    Servicestatus.where(:nagiostimeid => OFFSET.minutes.ago...Time.now).where(:current_state => 1...8).where(:host_name => host).where(:service_description => "HTTP").count
  end
end
