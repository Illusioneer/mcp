class Alert < ActiveRecord::Base
  attr_accessible :acknowledged, :alarm_id, :metadata, :since, :status
  serialize :acknowledged, ActiveRecord::Coders::Hstore
  serialize :metadata, ActiveRecord::Coders::Hstore
end
