class Hoststatus < ActiveRecord::Base
  attr_accessible :current_event_id, :current_state, :host_name, :hostdata, :nagiostimeid
  serialize :hostdata, ActiveRecord::Coders::Hstore

end
