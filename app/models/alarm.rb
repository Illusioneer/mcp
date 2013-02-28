class Alarm < ActiveRecord::Base
  attr_accessible :category, :enddate, :name, :notify, :reqs, :startdate
  serialize :notify, ActiveRecord::Coders::Hstore
  serialize :reqs, ActiveRecord::Coders::Hstore
  
  # notify - user/method (method is text/email)
  #reqs - service/failure level, time period limit, 
end
