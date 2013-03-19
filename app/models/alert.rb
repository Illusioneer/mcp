class Alert < ActiveRecord::Base
  attr_accessible :host, :name, :notifiers, :startdate, :stopdate, :trigger
end
