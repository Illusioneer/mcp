class Alarm < ActiveRecord::Base
  attr_accessible :category, :enddate, :name, :notify, :reqs, :startdate
  serialize :notify, ActiveRecord::Coders::Hstore
  serialize :reqs, ActiveRecord::Coders::Hstore
  
  def self.sweeplist
    return Rails.cache.fetch('sweeplist', :expires_in => 20.minutes) {Alarm.where("startdate < ? AND enddate > ?", Time.zone.now, Time.zone.now).all}
  end
end
